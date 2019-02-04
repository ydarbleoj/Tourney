class RoundAgg < ApplicationRecord
  belongs_to :tournament_round

  has_one :new_course, through: :touranment_round
  has_one :course_agg, through: :new_course
  has_one :tournament, through: :tournament_round

  has_one :easiest_hole, class_name: 'Hole', primary_key: :easiest_hole_id, foreign_key: :id
  has_one :hardest_hole, class_name: 'Hole', primary_key: :hardest_hole_id, foreign_key: :id
  has_one :lowest_round, class_name: 'Scorecard', primary_key: :lowest_round_id, foreign_key: :id
  has_many :scorecards, through: :tournament_round
  has_many :user_scores, through: :scorecards

  def scorecard_avgs
    scorecards.completed.round_averages
  end

  def lowest_round
    scorecards.lowest_round
  end

  def hole_par_avgs
    user_scores
    .group(:par).average(:net)
  end

  def hole_difficulty
    user_scores.joins(:hole)
    .select('holes.id AS hole_id, (net::decimal - holes.par) AS hole_diff')
    .order('hole_diff DESC')
  end
end
