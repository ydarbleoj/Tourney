class UserCourseAggSerializer
  include FastJsonapi::ObjectSerializer
  set_type :user_course_agg
  set_id :id

  belongs_to :new_course
  belongs_to :user

  attributes :user_id, :gross_avg, :net_avg, :putts_avg, :three_putts_avg,
    :par3_avg, :par4_avg, :par5_avg, :easiest_hole, :hardest_hole

end