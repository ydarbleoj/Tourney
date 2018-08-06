FactoryGirl.define do
  factory :scorecard do
    user
    tournament_round
    new_course_id { tournament_round.new_course_id }
    round_num { tournament_round.round_number }
    total_score 0
    total_putts 0
    total_3putts 0
    handicap { user.handicap }
    net_skin_total 0
    gross_skin_total 0
    finished false
    total_net 0
    association :leaderboard, factory: :leaderboard
  end

  trait :test_setup do
    after :create do |scorecard|
      course = scorecard.new_course

      (0..17).each do |i|
        FactoryGirl.create(:user_score, scorecard_id: scorecard.id, number: (i + 1), score: rand(2..8), putts: rand(0..3), handicap: scorecard.handicap, par: course.holes[i])
      end
      p 'factory'
      p total_score  = scorecard.user_scores.sum(:score)
      total_putts  = scorecard.user_scores.sum(:putts)
      total_net    = scorecard.user_scores.sum(:net)
      total_3putts = scorecard.user_scores.where('putts > ?', 2).size

      scorecard.update(total_score: total_score, total_putts: total_putts, total_net: total_net, total_3putts: total_3putts)
    end
  end

  # trait :add_leaderboard_join_table do
  #   after :create do |scorecard|
  #     tournament_id = scorecard.tournament_round.tournament_id
  #     leaderboard   = FactoryGirl.create(:leaderboard, user_id: scorecard.user_id, tournament_id: tournament_id)
  #     LeaderboardScorecard.create(scorecard_id: scorecard.id, leaderboard_id: leaderboard.id)
  #   end
  # end

end
