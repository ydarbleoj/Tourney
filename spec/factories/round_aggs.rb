FactoryGirl.define do
  factory :round_agg do
    tournament nil
    new_course_id 1
    net_lowest "MyString"
    par3_avg 1
    par4_avg 1
    par5_avg 1
    hardest_hole "MyString"
    easiest_hole "MyString"
    net_avg 1
    putts_avg 1
  end
end
