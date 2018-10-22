FactoryGirl.define do
  factory :user_score do
    scorecard
    number 1
    score 4
    putts 2
    handicap 1
    par 4
  end
end
