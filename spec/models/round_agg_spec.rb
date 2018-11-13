require 'rails_helper'

RSpec.describe RoundAgg, type: :model do
  before(:all) do
    @tournament1 = create(:tournament)
    @user1 = create(:user, handicap: 5)
    @user2 = create(:user, handicap: 15)
    @user3 = create(:user, handicap: 25)
    @course = create(:new_course, :bandon_dunes)
    @course2 = create(:new_course, :bandon_trails)
    @tourn_round1 = create(:tournament_round, new_course_id: @course.id, round_number: 1, tournament_id: @tournament1.id)
    @tourn_round2 = create(:tournament_round, new_course_id: @course2.id, round_number: 2, tournament_id: @tournament1.id)
    @leaderboard1 = create(:leaderboard, tournament_id: @tournament1.id, user_id: @user1.id, handicap: @user1.handicap)
    @leaderboard2 = create(:leaderboard, tournament_id: @tournament1.id, user_id: @user2.id, handicap: @user2.handicap)
    @leaderboard3 = create(:leaderboard, tournament_id: @tournament1.id, user_id: @user3.id, handicap: @user3.handicap)
    @round_agg = create(:round_agg, tournament_round_id: @tourn_round1.id)
    @scorecard1 = create(:scorecard, :low_scores, new_course_id: @course.id, leaderboard_id: @leaderboard1.id, user_id: @user1.id, tournament_round_id: @tourn_round1.id,handicap: @user1.handicap,
      round_num: 1, finished: true)
    @scorecard2 = create(:scorecard, :mid_scores, new_course_id: @course.id, leaderboard_id: @leaderboard2.id, user_id: @user2.id, tournament_round_id: @tourn_round1.id,handicap: @user2.handicap,
      round_num: 1, finished: true)
    @scorecard3 = create(:scorecard, :high_scores, new_course_id: @course.id, leaderboard_id: @leaderboard3.id, user_id: @user3.id, tournament_round_id: @tourn_round1.id,handicap: @user3.handicap,
      round_num: 1, finished: true)
    @scorecard4 = create(:scorecard, leaderboard_id: @leaderboard1.id, user_id: @user1.id, tournament_round_id: @tourn_round2.id,
      total_score: 98, total_putts: 32, total_3putts: 2, new_course_id: @course2.id, total_net: 80, handicap: @user1.handicap,
      round_num: 1, finished: true)
  end

  describe "hole averages" do
    it "should return correct avgs of scorecards" do
      aa = @round_agg.scorecard_avgs
      expect(aa['count']).to eq(3)
      expect(aa['net_avg'].to_f.round(1)).to eq(78.0)
      expect(aa['gross_avg'].to_f.round(1)).to eq(93)
      expect(aa['putts_avg'].to_f.round(1)).to eq(38.7)
      expect(aa['three_putts_avg'].to_f.round(1)).to eq(2.7)
    end
  end

   describe 'hole par avgs' do
    it "should return correct avgs" do
      aggs = @round_agg.hole_par_avgs
      expect(aggs[3].to_f.round(1)).to eq(3.5)
      expect(aggs[4].to_f.round(1)).to eq(4.3)
      expect(aggs[5].to_f.round(1)).to eq(5.3)
    end
  end

  describe 'hole difficulty' do
    it "should return easiest and hardiest holes" do
      aggs = @round_agg.hole_difficulty
      hardest = aggs[0]
      easiest = aggs[-1]

      expect(hardest.attributes['hole_diff'].to_f.round(1)).to eq(0.7)
      expect(easiest.attributes['hole_diff'].to_f.round(1)).to eq(0.0)
    end
  end

end
