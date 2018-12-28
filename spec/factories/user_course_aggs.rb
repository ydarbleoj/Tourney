FactoryGirl.define do
  factory :user_course_agg do
    user
    new_course
    gross_avg { 85.5 }
    net_avg { 79.5 }
    putts_avg { 32.5 }
    three_putts_avg { 1.5 }
    greens_in_reg { 8.5 }
    par3_avg { 3.5 }
    par4_avg { 4.5 }
    par5_avg { 5.5 }
    easiest_hole { "4 (par 4) - 4.2 avg" }
    hardest_hole { "15 (par 3) - 3.9 avg" }
  end

  trait :mid_handicap do
    gross_avg { 90.5 }
    net_avg { 85.5 }
    putts_avg { 34.5 }
    three_putts_avg { 3.5 }
    greens_in_reg { 5.5 }
    par3_avg { 4.1 }
    par4_avg { 5.2 }
    par5_avg { 6.5 }
    easiest_hole { "5 (par 4) - 4.5 avg" }
    hardest_hole { "15 (par 3) - 4.5 avg" }
  end
end
