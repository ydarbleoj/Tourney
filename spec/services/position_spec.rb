require'rails_helper'

RSpec.describe Position do
  before(:all) do
    @tournament1 = create(:tournament)
    @user1 = create(:user, handicap: 5)
    @user2 = create(:user, handicap: 15)
    @user3 = create(:user, handicap: 25)
    @user4 = create(:user, handicap: 5)
    @user5 = create(:user, handicap: 15)
    @user6 = create(:user, handicap: 25)
    @leaderboard1 = create(:leaderboard, tournament_id: @tournament1.id, user_id: @user1.id, handicap: @user1.handicap, total_score: 0)
    @leaderboard2 = create(:leaderboard, tournament_id: @tournament1.id, user_id: @user2.id, handicap: @user2.handicap, total_score: 2)
    @leaderboard3 = create(:leaderboard, tournament_id: @tournament1.id, user_id: @user3.id, handicap: @user3.handicap, total_score: 2)
    @leaderboard4 = create(:leaderboard, tournament_id: @tournament1.id, user_id: @user4.id, handicap: @user4.handicap, total_score: 7)
    @leaderboard5 = create(:leaderboard, tournament_id: @tournament1.id, user_id: @user5.id, handicap: @user5.handicap, total_score: 8)
    @leaderboard6 = create(:leaderboard, tournament_id: @tournament1.id, user_id: @user6.id, handicap: @user6.handicap, total_score: 10)
  end

  describe "setter" do
    it "should set the pos for each leaderboard" do
      lbs = @tournament1.leaderboards.stroke
      p res = Position.setter(lbs, :total_score)
    end
  end
end