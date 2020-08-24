FactoryGirl.define do
  factory :team do
    new_course
    tournament_round
    finished false

    total_net { }
  end
end
