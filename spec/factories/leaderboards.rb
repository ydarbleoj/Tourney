FactoryGirl.define do
  factory :leaderboard do
    rnd1_score 0
    rnd2_score 0
    rnd3_score 0
    rnd1_putts 0
    rnd2_putts 0
    rnd3_putts 0
    user
    tournament
    handicap { user.handicap }
    rnd1_3putts 0
    rnd2_3putts 0
    rnd3_3putts 0
    total_score 0
    total_putts 0
    total_3_putts 0
  end

  trait :with_scorecards do

  end

end
