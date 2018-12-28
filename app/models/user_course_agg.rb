class UserCourseAgg < ApplicationRecord
  belongs_to :user
  belongs_to :new_course

  has_many :tournament_rounds, through: :new_course
  has_many :user_hole_aggs
  has_many :scorecards, through: :user
  # has_many :user_scores, through: :scorecards


  def self.overall(course_id)
    where(new_course_id: course_id).first
  end

  def scorecard_averages(course_id)
    scorecards
    .where(new_course_id: course_id)
    .select("AVG(total_score) AS gross_avg,
      COUNT(scorecards.id) AS count,
      AVG(total_putts) AS putts_avg,
      AVG(total_net) AS net_avg,
      AVG(total_3putts) AS three_putts_avg")
  end

  def hole_par_avgs
    user_hole_aggs
    .group(:par).average(:net_avg)
  end

  def hole_difficulty
    user_hole_aggs.joins(:hole)
    .select('user_hole_aggs.par, holes.number, holes.handicap, net_avg, (net_avg::decimal - user_hole_aggs.par) AS hole_diff')
    .order('hole_diff DESC')
  end
end
