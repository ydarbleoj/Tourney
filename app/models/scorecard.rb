class Scorecard < ApplicationRecord
  scope :completed, -> { where(finished: true) }
  scope :round_open, -> { where(finished: false) }

  belongs_to :user
  belongs_to :tournament_round
  belongs_to :new_course

  has_one :tournament, through: :tournament_round
  has_one :leaderboard_scorecard
  has_one :leaderboard, through: :leaderboard_scorecard
  has_many :user_scores, dependent: :destroy

  accepts_nested_attributes_for :user_scores

  after_save :check_for_last_scorecard
  after_save :update_leaderboard
  after_save :update_skins

  def total_user_scores
    self.update_columns(:finished, true) if self.finished.blank? && self.played_eighteen?
    scores = self.user_scores.select('SUM(score) AS total_score, SUM(net) AS total_net, SUM(putts) AS total_putts, SUM(CASE WHEN putts > 2 THEN 1 ELSE 0 END) AS total_3putts')[0].as_json

    self.update_columns(scores.except!('id'))
  rescue => e
    p e.inspect
  end

  def played_eighteen?
    self.user_scores.size == 18
  end

  def update_leaderboard
    Leaderboard.new.scorecard_update(self)
  end

  def _total_net
    return self.total_net if self.finished
    self.user_scores.map(&:net).inject(0, :+)
  end

  def _total_putts
    return self.total_putts if self.finished
    self.user_scores.map(&:putts).inject(0, :+)
  end

  def _total_3putts
    return self.total_3putts if self.finished
    self.user_scores.map { |x| x.putts if x.putts > 2 }.compact.length
  end

  def _course_par_played
    return self.new_course.par if self.finished
    holes = self.user_scores.map(&:number)
    self.new_course.holes.where(number: holes).sum(:par)
  end

  def score
    self.total_net - _course_par_played
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

  def self.check_scores(tr_id, ids, number)
    joins(:user_scores)
    .where('tournament_round_id = ? AND user_id IN (?)AND user_scores.number = ?', tr_id, ids, number)
    .pluck(:user_id).size
  end

  def self.add_team_score(tr_id, ids, number)
    joins(:user_scores)
    .where('tournament_round_id = ?
      AND user_id IN (?)AND user_scores.number = ?', tr_id, ids, number)
    .order('user_scores.net ASC').pluck('user_scores.net').first(2).sum
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

  # add to callbacks but ensure there isn't an update loop
  def update_skins
    p 'skin update'
    net_skin = self.user_scores.where(net_skin: true).count
    Scorecard.transaction do
      self.update_columns(net_skin_total: net_skin)
    end
  end

end
