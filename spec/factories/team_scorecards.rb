FactoryGirl.define do
  factory :team_scorecard do
    new_course
    tournament_round
    finished false

    total_net { }
  end
end
