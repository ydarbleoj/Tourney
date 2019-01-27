class UserAgg < ApplicationRecord
  belongs_to :user

  has_many :scorecards, through: :user
  has_many :user_course_aggs, through: :user

  has_one :lowest_round, class_name: 'Scorecard', primary_key: :lowest_round_id, foreign_key: :id

  def calc_avgs
    user_course_aggs
    .select("SUM(user_course_aggs.count) AS count,
      ROUND(AVG(((user_course_aggs.count::decimal / nullif(count, 0)) * 1.0) * user_course_aggs.net_avg), 2) AS net_avg,
      ROUND(AVG(((user_course_aggs.count::decimal / nullif(count, 0)) * 1.0) * user_course_aggs.par3_avg), 2) AS par3_avg,
      ROUND(AVG(((user_course_aggs.count::decimal / nullif(count, 0)) * 1.0) * user_course_aggs.par4_avg), 2) AS par4_avg,
      ROUND(AVG(((user_course_aggs.count::decimal / nullif(count, 0)) * 1.0) * user_course_aggs.par5_avg), 2) AS par5_avg,
      ROUND(AVG(((user_course_aggs.count::decimal / nullif(count, 0)) * 1.0) * user_course_aggs.gross_avg), 2) AS gross_avg,
      ROUND(AVG(((user_course_aggs.count::decimal / nullif(count, 0)) * 1.0) * user_course_aggs.putts_avg), 2) AS putts_avg,
      ROUND(AVG(((user_course_aggs.count::decimal / nullif(count, 0)) * 1.0) * user_course_aggs.three_putts_avg), 2) AS three_putts_avg,
      ROUND(AVG(((user_course_aggs.count::decimal / nullif(count, 0)) * 1.0) * user_course_aggs.greens_in_reg), 2) AS greens_in_reg")
  end

  def calc_hcap_diff
    scorecards.user_hcap_diff
  end

  def lowest_round
    scorecards.lowest_round
  end
end
