class CourseAggSerializer
  include FastJsonapi::ObjectSerializer
  set_type :course_agg
  set_id :id

  attributes :gross_avg, :net_avg, :putts_avg, :three_putts_avg,
    :par3_avg, :par4_avg, :par5_avg, :easiest_hole, :hardest_hole, :lowest_round, :highest_round
end