FactoryGirl.define do


  factory :user_score do
    user
    scorecard
    number
    score
    putts 1
    skin false
    net 1
  end
end
