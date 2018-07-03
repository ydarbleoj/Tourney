FactoryGirl.define do
  factory :tournament_round do
    tournament
    round_number 1
    round_date { DateTime.now + 160.days }
    new_course
  end
end
