class CourseAggSerializer
  include FastJsonapi::ObjectSerializer
  set_type :course_agg
  set_id :id

  attributes :gross_avg, :net_avg, :putts_avg, :three_putts_avg, :par3_avg, :par4_avg, :par5_avg, :hcap_diff

  attribute :lowest_round do |obj|
    {
      username: obj.lowest_round.user.username,
      total_net: obj.lowest_round.total_net,
      total_putts: obj.lowest_round.total_putts,
      year: obj.lowest_round.created_at.strftime("%Y")
    } if obj.lowest_round
  end

  attribute :easiest_hole do |obj|
    {
      net_avg: obj.easiest_hole.net_avg,
      gross_avg: obj.easiest_hole.gross_avg,
      putts_avg: obj.easiest_hole.putts_avg,
      three_putts_avg: obj.easiest_hole.three_putts_avg,
      par: obj.easiest_hole.new_course.par,
      number: obj.easiest_hole.hole.number,
    } if obj.easiest_hole
  end

  attribute :hardest_hole do |obj|
    {
      net_avg: obj.hardest_hole.net_avg,
      gross_avg: obj.hardest_hole.gross_avg,
      putts_avg: obj.hardest_hole.putts_avg,
      three_putts_avg: obj.hardest_hole.three_putts_avg,
      par: obj.hardest_hole.new_course.par,
      number: obj.hardest_hole.hole.number,
    } if obj.hardest_hole
  end
end