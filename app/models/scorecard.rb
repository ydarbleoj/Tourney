class Scorecard < ApplicationRecord
  scope :completed, -> { where(finished: true) }
  scope :round_open, -> { where(finished: false) }

  belongs_to :user
  belongs_to :tournament_round
  belongs_to :new_course
  belongs_to :leaderboard

  has_one :tournament, through: :tournament_round
  has_one :course_agg, through: :new_course

  has_many :user_scores, dependent: :destroy
  has_many :holes, through: :new_course

  has_many :tournament_aggs, through: :tournament
  has_many :touranment_round_aggs, through: :tournament_round
  has_many :user_hole_aggs, through: :user


  accepts_nested_attributes_for :user_scores

  after_save :check_for_last_scorecard

  def self.adding_total_score
    joins(:new_course)
    .where(finished: true)
    .select('SUM(total_net - new_courses.par) AS net_total')[0].attributes['net_total']
  end

  def self.course_info
    includes(:user_scores)
    .select('scorecards.id, scorecards.total_score, scorecards.total_putts,
      scorecards.total_3putts, scorecards.handicap, scorecards.total_net')
    .map do |sc|
      {
        id: sc.id,
        total_net: sc.total_net,
        total_score: sc.total_score,
        total_putts: sc.total_putts,
        total_3putts: sc.total_3putts,
        handicap: sc.handicap,
        in_net: in_scores(sc, 'net'),
        out_net: out_scores(sc, 'net'),
        in_gross: in_scores(sc, 'score'),
        out_gross: out_scores(sc, 'score'),
        in_putts: in_scores(sc, 'putts'),
        out_putts: out_scores(sc, 'putts'),
        in_3putts: in_3putts(sc),
        out_3putts: out_3putts(sc),
      }
    end
  end

  def self.in_3putts(sc)
    sc.user_scores.select { |x| x if x.number > 9 && x.putts > 2 }.map { |y| y }.length
  end

  def self.out_3putts(sc)
    sc.user_scores.select { |x| x if x.number < 10 && x.putts > 2 }.map { |y| y }.length
  end

  def self.in_scores(sc, type)
    sc.user_scores.select { |x| x if x.number > 9 }.map { |y| y.send(type) }.inject(0) { |sum, i| sum + i }

  end

  def self.out_scores(sc, type)
    sc.user_scores.select { |x| x if x.number < 10 }.map { |y| y.send(type) }.inject(0) { |sum, i| sum + i }
  end

  def self.add_team_score(ids, number)
    joins(:user_scores)
    .where('user_id IN (?) AND user_scores.number = ?', ids, number)
    .order('user_scores.net ASC').pluck('user_scores.net').first(2).sum
  end

  def update_totals
    scores = self.user_scores.select('SUM(score) AS total_score, SUM(net) AS total_net, SUM(putts) AS total_putts, SUM(CASE WHEN putts > 2 THEN 1 ELSE 0 END) AS total_3putts')[0].as_json
    update(scores.except!('id'))
  end

  def check_for_last_scorecard
    last_scorecard = TournamentRound.find(self.tournament_round_id).scorecards.round_open

    if last_scorecard.blank?
      begin
        update_money_lists(self)
      rescue => e
        p e
      end
    end
  end

  def update_money_lists(scorecard)
    rnd_number = scorecard.round_num
    case rnd_number
    when 1
      SkinsMoney.update_player_money(scorecard)
    when 2
      SkinsMoney.update_player_money(scorecard)
    when 3
      SkinsMoney.update_player_money(scorecard)
      PuttingMoney.update_player_money(scorecard.tournament_round.tournament)
      StrokeMoney.update_player_money(scorecard.tournament_round.tournament)
    else
      return
    end
  end

  def self.user_skins(tournament_id, user)
    joins(:user_scores, :tournament_round)
    .where('user_scores.net_skin = ? AND tournament_rounds.tournament_id = ?', true, tournament_id)
    .select('COUNT(user_scores.id) AS total')
    .map { |x| { user_id: user.id, username: user.first_name + ' ' + user.last_name.first, total: x.total } }
  end

  def self.skins_preview
    joins(:user_scores, :user)
    .where('user_scores.net_skin = ?', true)
    .group('users.id')
    .select('users.id AS user_id, users.first_name AS first_name, users.last_name AS last_name, COUNT(users.id) AS total')
    .map { |x| { user_id: x.user_id, username: x.first_name + ' ' + x.last_name.first, total: x.total } }
    .sort_by { |x| x[:total] }.reverse.first(5)
  end

    # .where('user_scores.net_skin = ?', true)
  def self.skins_total
    joins(:user_scores, :user)
    .select('users.id AS user_id, users.first_name AS first_name, users.last_name AS last_name, scorecards.round_num, user_scores.number, user_scores.net, user_scores.net_skin')
    .group_by { |x| [x.user_id, x.first_name + ' ' + x.last_name.first] }
    .map do |x|
      {
        username: x[0][1],
        user_id: x[0][0],
        total: sum_skins(x[1]),
      }.merge(merge_rounds(group_rounds(x[1])))
    end.sort_by { |x| x[:total] }.reverse
  end

  def self.skins_preview_total
    joins(:user_scores, :user)
    .select('users.id AS user_id, users.first_name AS first_name, users.last_name AS last_name, scorecards.round_num, user_scores.number, user_scores.net, user_scores.net_skin')
    .group_by { |x| [x.user_id, x.first_name + ' ' + x.last_name.first] }
    .map { |y| sum_skins(y[1]) }
    .group_by { |x| x }.map { |x| x[1] }.sort_by {|x| x }.reverse
  end

  def self.sum_skins(arr)
    arr.select { |x| x if x.net_skin == true }.map { |x| x }.length
  end

  def self.group_rounds(array)
    arr = array.select { |x| x if x.net_skin == true }.map { |x| x }

    if arr.blank?
      [{ :rnd1 => '', :rnd1holes => '', :rnd2 => '', :rnd2holes => '', :rnd3 => '', :rnd3holes => '' }]
    else
      arr.group_by { |x| x.round_num }
      .map { |x| { "rnd#{x[0]}".to_sym => x[1].length, "rnd#{x[0]}holes".to_sym => set_holes(x[1]) } }
    end
  end

  def self.set_holes(array)
    array.sort_by { |x| x[:number] }
    .map { |x| "#{x[:number]} / #{x[:net]}" }
  end

  def self.merge_rounds(array)
    array.inject({}) { |agg, hash| agg.merge(hash) { |k, a, b| a + b }.except(:user_id, :username) }
  end

  def update_skins(type)
    total = type == 'net_skin' ? 'net_skin_total' : 'gross_skin_total'
    n = self.user_scores.where(type.to_sym => true).size
    self.update_columns(total.to_sym => n)
  end

end
