class HoleAgg < ApplicationRecord
  belongs_to :course_agg
  belongs_to :hole

  has_one :new_course, through: :course_agg
  has_many :user_hole_aggs, through: :hole

  # SUM(((user_hole_aggs.count / self.count) * 1.0)) determines weight of users avg
  # to apply, giving higher weight to avgs with higher counts
  def user_hole_avgs
    count = (self.count.blank? || self.count == 0) ? 1 : self.count
    user_hole_aggs
    .select("
      SUM(((user_hole_aggs.count::decimal / #{count}) * 1.0) * user_hole_aggs.net_avg) AS net_avg,
      SUM(((user_hole_aggs.count::decimal / #{count}) * 1.0) * user_hole_aggs.gross_avg) AS gross_avg,
      SUM(((user_hole_aggs.count::decimal / #{count}) * 1.0) * user_hole_aggs.putts_avg) AS putts_avg,
      SUM(((user_hole_aggs.count::decimal / #{count}) * 1.0) * user_hole_aggs.three_putts_avg) AS three_putts_avg,
      SUM(((user_hole_aggs.count::decimal / #{count}) * 1.0) * user_hole_aggs.greens_in_reg) AS greens_in_reg,
      SUM(user_hole_aggs.count) AS count
    ")
  end

end
