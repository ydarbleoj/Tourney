class UserAggsSerializer
  include FastJsonapi::ObjectSerializer
  set_type :user_agg
  set_id :id


  attribute :hcap_diff do |obj|
    obj.hcap_diff.to_s
  end

  attribute :lowest_round do |obj|
    {
      total_net: obj.lowest_round.total_net,
      total_putts: obj.lowest_round.total_putts,
      course_name: obj.lowest_round.new_course.name,
      par: obj.lowest_round.new_course.par,
      year: obj.lowest_round.created_at.strftime("%Y")
    }
  end

  attribute :net_avg do |obj|
    obj.net_avg.to_s
  end

  attribute :gross_avg do |obj|
    obj.gross_avg.to_s
  end

end