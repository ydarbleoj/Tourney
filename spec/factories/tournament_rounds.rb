FactoryGirl.define do
  factory :tournament_round do
    tournament
    new_course
    round_number 1
    round_date { DateTime.now }
    tee_time_date { round_date }
  end
end
