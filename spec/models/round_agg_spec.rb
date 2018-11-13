require 'rails_helper'

RSpec.describe RoundAgg, type: :model do
  let(:tournament1) { create(:tournament) }
  let(:user1) { create(:user, handicap: 9) }
  let(:user2) { create(:user, handicap: 12) }
  let(:user3) { create(:user, handicap: 18) }
  let(:course) { create(:new_course) }
  let(:tourn_round1) { create(:tournament_round, new_course_id: course.id, round_number: 1, tournament_id: tournament1.id) }
  let(:round_agg) { create(:round_agg, tournament_id: tournament1.id, tournament_round_id: tourn_round1.id) }
  let(:leaderboard1) { create(:leaderboard, tournament_id: tournament1.id, user_id: user1.id, handicap: user1.handicap) }
  let(:leaderboard2) { create(:leaderboard, tournament_id: tournament1.id, user_id: user2.id, handicap: user2.handicap) }
  let(:leaderboard3) { create(:leaderboard, tournament_id: tournament1.id, user_id: user3.id, handicap: user3.handicap) }


  describe "hole averages" do
    it "should return correct avgs of scorecards" do
      create(:scorecard, leaderboard_id: leaderboard1.id, user_id: user1.id, tournament_round_id: tourn_round1.id,
        total_score: 88, total_putts: 30, total_3putts: 2, new_course_id: course.id, total_net: 79, handicap: user1.handicap,
        round_num: 1, finished: true)
      create(:scorecard, leaderboard_id: leaderboard2.id, user_id: user2.id, tournament_round_id: tourn_round1.id,
        total_score: 86, total_putts: 29, total_3putts: 1, new_course_id: course.id, total_net: 74, handicap: user2.handicap,
        round_num: 1, finished: true)
      create(:scorecard, leaderboard_id: leaderboard2.id, user_id: user3.id, tournament_round_id: tourn_round1.id,
        total_score: 98, total_putts: 32, total_3putts: 2, new_course_id: course.id, total_net: 80, handicap: user3.handicap,
        round_num: 1, finished: true)

      p aggs = round_agg.hole_par_avg


    end
  end
end
