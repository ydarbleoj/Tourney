class RoundAgg < ApplicationRecord
  belongs_to :tournament
  belongs_to :tournament_round

  has_one :new_course, through: :touranment_round
  has_one :course_agg, through: :new_course
  has_many :scorecards, through: :tournament_round
  has_many :user_scores, through: :scorecards

  def scorecard_averages

  end

  def hole_par_avg
    scorecards
    .select("AVG(scorecards.total_net) AS net_avg,
      AVG(scorecards.total_score) AS gross_avg,
      COUNT(scorecards.id) AS count,
      AVG(scorecards.total_putts) AS putts_avg,
      AVG(CASE WHEN scorecards.total_putts > 2 THEN 1 ELSE 0 END) AS three_putts_avg")[0].attributes
  end
end
