FactoryGirl.define do
  factory :team_score do
    team_scorecard
    number { rand(1..18) }
    net 4
    par 4
  end
end
