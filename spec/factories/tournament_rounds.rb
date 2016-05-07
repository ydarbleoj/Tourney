FactoryGirl.define do
  factory :tournament_round do
    tournament nil
    scorecard nil
    round_number 1
    tee_time ""
    tee_time_date ""
    group_number 1
  end
end
