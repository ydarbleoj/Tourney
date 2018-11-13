class CourseAgg < ApplicationRecord
  belongs_to :new_course

  has_many :scorecards, through: :new_course
  has_many :hole_aggs

  def scorecard_avgs
    scorecards
    .select("AVG(scorecards.total_net) AS net_avg,
      AVG(scorecards.total_score) AS gross_avg,
      COUNT(scorecards.id) AS count,
      AVG(scorecards.total_putts) AS putts_avg,
      AVG(scorecards.total_3putts) AS three_putts_avg")[0].attributes
  end

  def hole_par_avgs
    hole_aggs
    .group(:par).average(:net_avg)
  end

  def hole_difficulty
    hole_aggs.joins(:hole)
    .group('holes.number, holes.handicap, hole_aggs.par')
    .select('hole_aggs.par, holes.number, holes.handicap, AVG(hole_aggs.net_avg::decimal - hole_aggs.par) AS hole_diff')
    .order('hole_diff DESC')
  end

end
