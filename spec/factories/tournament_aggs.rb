FactoryGirl.define do
  factory :tournament_agg do
    tournament_id ""
    gross_avg 1
    net_avg 1
    lowest_round_id 1
    par3_avg 1
    par4_avg 1
    par5_avg 1
    hardest_hole_id 1
    easiest_hole_id 1
    highest_round_id 1
  end
end
