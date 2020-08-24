FactoryGirl.define do
  factory :tee_time do
    tournament_round
    user
    team
    tee_time { tournament_round.tee_time_date }
    group { ['Group B', 'Group C', 'Group D', 'Group A'].sample }
  end
end
