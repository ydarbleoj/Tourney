class Scorecard < ApplicationRecord
  scope :completed, -> { where(finished: true) }
  scope :round_open, -> { where(finished: false) }

  belongs_to :user
  belongs_to :tournament_round
  belongs_to :new_course

  has_many :user_scores, dependent: :destroy

  accepts_nested_attributes_for :user_scores

  before_save :set_handicap
  after_save :check_for_last_scorecard

  def self.course_info
    joins(:new_course)
    .select('scorecards.id, scorecards.total_score, scorecards.total_putts,
      scorecards.total_3putts, scorecards.handicap, scorecards.total_net,
      new_courses.name, new_courses.slope, new_courses.rating, new_courses.tee, new_courses.par, new_courses.yardage')
  end

  def check_for_last_scorecard
   p last_scorecard = TournamentRound.find(self.tournament_round_id).scorecards.round_open

    if last_scorecard.blank?
      update_money_lists(self)
    end
  end

  def update_money_lists(scorecard)
    rnd_number = scorecard.round_num
    case rnd_number
    when 1
      SkinsMoney.update_player_money(scorecard)
      # TeamMoney.update_player_money(scorecard)
    when 2
      SkinsMoney.update_player_money(scorecard)
      # TeamMoney.update_player_money(scorecard)
    when 3
      SkinsMoney.update_player_money(scorecard)
      # TeamMoney.update_player_money(scorecard)
      PuttingMoney.update_player_money(scorecard.tournament_round.tournament)
      # StrokeMoney.update_player_money(scorecard.tournament_round.tournament)
    else
      return
    end
  end

  def set_handicap
    self.handicap = self.user.handicap
  end

  def self.user_skins(tournament_id, user)
    joins(:user_scores, :tournament_round)
    .where('user_scores.net_skin = ? AND tournament_rounds.tournament_id = ?', true, tournament_id)
    .select('COUNT(user_scores.id) AS total')
    .map { |x| { user_id: user.id, username: user.username, total: x.total } }
  end

  def self.skins_preview
    joins(:user_scores, :user)
    .where('user_scores.net_skin = ?', true)
    .group('users.id')
    .select('users.id AS user_id, users.username AS username, COUNT(users.id) AS total')
    .map { |x| { user_id: x.user_id, username: x.username, total: x.total } }
    .sort_by { |x| x[:total] }.reverse.first(5)
  end

  def self.skins_total
    joins(:user_scores, :user)
    .where('user_scores.net_skin = ?', true)
    .select('users.id AS user_id, users.username AS username, scorecards.round_num, user_scores.number, user_scores.net')
    .group_by { |x| [x.user_id, x.username] }
    .map do |x|
      {
        username: x[0][1],
        user_id: x[0][0],
        total: x[1].length,
      }.merge(merge_rounds(group_rounds(x[1])))
    end.sort_by { |x| x[:total] }.reverse
  end

  def self.group_rounds(array)
    array.group_by { |x| x.round_num }
      .map { |x| { "rnd#{x[0]}".to_sym => x[1].length, "rnd#{x[0]}holes".to_sym => set_holes(x[1]) } }
  end

  def self.set_holes(array)
    array.sort_by { |x| x[:number] }
    .map { |x| "#{x[:number]} / #{x[:net]}" }
  end

  def self.merge_rounds(array)
    array.inject({}) { |agg, hash| agg.merge(hash) { |k, a, b| a + b }.except(:user_id, :username) }
  end

  def update_skins
    net_skin = self.user_scores.where(net_skin: true).count
    Scorecard.transaction do
      self.update_columns(net_skin_total: net_skin)
    end
  end

end
