FactoryGirl.define do
  factory :hole_agg do
    course_agg
    hole
    net_avg 0
    gross_avg 0
    putts_avg 0
    three_putts_avg 0
    count 1
    greens_in_reg 0
    par { hole.par }
  end
end
