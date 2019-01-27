class RoundAggSerializer
  include FastJsonapi::ObjectSerializer
  set_type :round_agg
  set_id :id

  attributes :gross_avg, :net_avg, :putts_avg, :three_putts_avg,
    :par3_avg, :par4_avg, :par5_avg, :easiest_hole, :hardest_hole, :net_lowest
end