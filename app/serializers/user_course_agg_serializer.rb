class UserCourseAggSerializer
  include FastJsonapi::ObjectSerializer
  set_type :user_course_agg
  set_id :id

  belongs_to :new_course
  belongs_to :user

  attributes :user_id, :gross_avg, :net_avg, :putts_avg, :three_putts_avg, :par3_avg, :par4_avg, :par5_avg, :hcap_diff

  attribute :lowest_round do |obj|
    {
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
      par: obj.easiest_hole.hole.par,
      number: obj.easiest_hole.hole.number,
    } if obj.easiest_hole
  end

  attribute :hardest_hole do |obj|
    {
      net_avg: obj.hardest_hole.net_avg,
      gross_avg: obj.hardest_hole.gross_avg,
      putts_avg: obj.hardest_hole.putts_avg,
      three_putts_avg: obj.hardest_hole.three_putts_avg,
      par: obj.hardest_hole.hole.par,
      number: obj.hardest_hole.hole.number,
    } if obj.hardest_hole
  end
end