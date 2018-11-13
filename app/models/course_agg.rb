class CourseAgg < ApplicationRecord
  belongs_to :new_course

  has_many :round_agg, through: :new_course
  has_many :hole_aggs

  def hole_averages
    round_aggs
    .select("AVG(gross_avg) AS gross_avg,
      AVG(putts_avg) AS putts_avg,
      AVG(net_avg) AS net_avg,
      AVG(total_3putts) AS three_putts_avg")
  end

  def hole_par_avgs
    hole_aggs
    .group(:par).average(:net_avg)
  end

  def hole_difficulty
    user_hole_aggs.joins(:hole)
    .select('user_hole_aggs.par, holes.number, holes.handicap, net_avg, (net_avg - user_hole_aggs.par) AS hole_diff')
    .order('hole_diff DESC').as_json
  end

end
