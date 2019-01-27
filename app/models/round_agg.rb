class RoundAgg < ApplicationRecord
  belongs_to :tournament_round

  has_one :new_course, through: :touranment_round
  has_one :course_agg, through: :new_course
  has_one :tournament, through: :tournament_round

  has_many :scorecards, through: :tournament_round
  has_many :user_scores, through: :scorecards

  def scorecard_avgs
    scorecards.round_averages
  end

  def hole_par_avgs
    user_scores
    .group(:par).average(:net)
  end

  def hole_difficulty
    user_scores.joins(:hole)
    .group('user_scores.number, holes.handicap, holes.par')
    .select('user_scores.number, holes.handicap, holes.par, AVG(net - holes.par) AS hole_diff')
    .order('hole_diff DESC')
  end
end
