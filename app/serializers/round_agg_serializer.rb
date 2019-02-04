class RoundAggSerializer
  include FastJsonapi::ObjectSerializer
  set_type :round_agg
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
    scores = obj.user_scores.select {|x| x if x.number == obj.easiest_hole.number }.map { |x| x }
    net_avg = (scores.map { |x| x.net }.reduce(:+).to_f / scores.size).round(2)
    putts_avg = (scores.map { |x| x.putts }.reduce(:+).to_f / scores.size).round(2)
    three_putts_avg = (scores.select { |x| x if x.putts > 2 }.map { |x| x.putts }.reduce(:+).to_f / scores.size).round(2)
    {
      net_avg: net_avg,
      putts_avg: putts_avg,
      three_putts_avg: three_putts_avg,
      par: obj.easiest_hole.par,
      number: obj.easiest_hole.number,
    } if obj.easiest_hole
  end

  attribute :hardest_hole do |obj|
    scores = obj.user_scores.select {|x| x if x.number == obj.hardest_hole.number }.map { |x| x }
    net_avg = (scores.map { |x| x.net }.reduce(:+).to_f / scores.size).round(2)
    putts_avg = (scores.map { |x| x.putts }.reduce(:+).to_f / scores.size).round(2)
    three_putts_avg = (scores.select { |x| x if x.putts > 2 }.map { |x| x.putts }.reduce(:+).to_f / scores.size).round(2)
    {
      net_avg: net_avg,
      putts_avg: putts_avg,
      three_putts_avg: three_putts_avg,
      par: obj.hardest_hole.par,
      number: obj.hardest_hole.number,
    } if obj.hardest_hole
  end
end