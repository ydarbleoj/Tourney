class UserCourseAgg < ApplicationRecord
  belongs_to :user
  belongs_to :new_course

  has_many :user_hole_aggs
  has_many :scorecards, through: :user
  # has_many :user_scores, through: :scorecards


  def scorecard_averages(course_id)
    scorecards
    .where(new_course_id: course_id)
    .select("AVG(total_score) AS gross_avg,
      COUNT(scorecards.id) AS count,
      AVG(total_putts) AS putts_avg,
      AVG(total_net) AS net_avg,
      AVG(total_3putts) AS three_putts_avg")
  end

    # .select('AVG(CASE WHEN par = 4 THEN user_hole_aggs.net_avg ELSE 0 END) AS par4_avg')
  def hole_aggs(course_id)
    .where(new_course_id: course_id)
    .group(:par)
    .average(:net_avg)
    .average(:gross_avg)
    .average
  end
end
