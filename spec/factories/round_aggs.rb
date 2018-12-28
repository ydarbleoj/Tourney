FactoryGirl.define do
  factory :round_agg do
    tournament_round
    net_lowest { 'Jim John - 71' }
    hardest_hole { '10 (par 4) - 4.9 avg' }
    easiest_hole { '14 (par 3) - 3.2 avg ' }
    gross_avg { 90.5 }
    net_avg { 80.5 }
    putts_avg { 34.5 }
    three_putts_avg { 2.5 }
    par3_avg { 3.2 }
    par4_avg { 4.7 }
    par5_avg { 5.5 }
    count { 16 }
  end
end
