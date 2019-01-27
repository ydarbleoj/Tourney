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

  def self.for_user_round(user_id, round_id)
    includes({new_course: :holes}, :user_scores).where(user_id: user_id, tournament_round_id: round_id).first
  end

  def self.adding_total_score
    joins(:new_course)
    .where(finished: true)
    .select('SUM(total_net - new_courses.par) AS net_total')[0].attributes['net_total']
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

  #
  # AGGS
  #
  def self.hole_averages(user_id, course_id, hole_id)
    joins(user_scores: :hole)
    .where(user_scores: { hole_id: hole_id }, new_course_id: course_id, user_id: user_id)
    .select("AVG(net) AS net_avg,
      AVG(score) AS gross_avg,
      COUNT(scorecards.id) AS count,
      AVG(putts) AS putts_avg,
      AVG(CASE WHEN putts > 2 THEN 1 ELSE 0 END) AS three_putts_avg,
      AVG(CASE WHEN score = holes.par
        AND putts > 1 THEN 1 ELSE 0 END) AS greens_in_reg")
  end

  def self.user_course_averages(user_id, course_id)
    joins(:new_course)
    .where(new_course_id: course_id, user_id: user_id)
    .select("AVG(total_score) AS gross_avg,
      COUNT(scorecards.id) AS count,
      AVG(total_putts) AS putts_avg,
      AVG(total_net) AS net_avg,
      AVG(total_3putts) AS three_putts_avg")
  end

  def self.course_averages(course_id)
    joins(:new_course)
    .where(new_course_id: course_id)
    .select("AVG(total_score) AS gross_avg,
      AVG(total_putts) AS putts_avg,
      AVG(total_net) AS net_avg,
      AVG(total_3putts) AS three_putts_avg")
  end

  def self.lowest_round
    where(finished: true).order(total_net: :asc).first
  end

  def self.user_hcap_diff
    joins(:new_course)
    .select("ROUND(AVG((scorecards.total_net::decimal - new_courses.par) - scorecards.handicap), 2) AS hcap_diff,
     ROUND(AVG(scorecards.handicap::decimal), 2) AS hcap_avg")
  end

  def self.round_averages
    joins(:new_course)
    .select("ROUND(AVG(total_score), 2) AS gross_avg,
      ROUND(AVG(total_putts), 2) AS putts_avg,
      ROUND(AVG(total_net), 2) AS net_avg,
      ROUND(AVG(total_3putts), 2) AS three_putts_avg,
      ROUND(AVG((scorecards.total_net::decimal - new_courses.par) - scorecards.handicap), 2) AS hcap_diff,
      ROUND(AVG(scorecards.handicap::decimal), 2) AS hcap_avg")

  end
#----> NEEDS REFACTORING OR REMOVAL
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
