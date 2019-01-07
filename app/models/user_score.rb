class UserScore < ApplicationRecord
  belongs_to :scorecard, touch: true
  belongs_to :hole
  has_one :user, through: :scorecard
  has_one :tournament_round, through: :scorecard
  has_one :leaderboard, through: :scorecard

  validates :scorecard_id, presence: true
  validates :number, presence: true
  validates :score, presence: true
  validates :putts, presence: true

  before_save :calculate_net
  after_save :update_scorecard

  def update_scorecard
    scorecard.update_totals
  end

  def calculate_net
    return if score.blank?
    handicap  = scorecard.handicap
    hole_hcap = hole.handicap

    if handicap < 19
      self.net = handicap >= hole_hcap ? score - 1 : score
    else
      new_cap = handicap - 18
      self.net = new_cap >= hole_hcap ? score - 2 : score - 1
    end
  end

  def self.skins_for(number, type)
    score = type == 'net_skin' ? 'net' : 'score'
    where(number: number)
    .select("user_scores.id AS id, #{type} AS skin, #{score} AS score, scorecard_id, number, putts, hole_id, par")
  end

end
