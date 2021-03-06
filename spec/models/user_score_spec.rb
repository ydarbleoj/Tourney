require 'rails_helper'

RSpec.describe UserScore, :type => :model do
  let(:tournament) { create(:tournament) }

  describe "calculate_net" do
    it "should return correct net score below 18 handicap" do
      course = create(:new_course, name: 'The Course')
      tourn_round = create(:tournament_round, new_course_id: course.id, tournament_id: tournament.id)
      user1 = create(:user, handicap: 9)
      user2 = create(:user, handicap: 22)
      user3 = create(:user, handicap: 32)
      leaderboard1 = create(:leaderboard, tournament_id: tournament.id, user_id: user1.id)
      leaderboard2 = create(:leaderboard, tournament_id: tournament.id, user_id: user2.id)
      leaderboard3 = create(:leaderboard, tournament_id: tournament.id, user_id: user3.id)

      hole1 = create(:hole, new_course_id: course.id, par: 4, handicap: 4, number: 1)
      hole2 = create(:hole, new_course_id: course.id, par: 5, handicap: 14, number: 2)
      hole3 = create(:hole, new_course_id: course.id, par: 3, handicap: 18, number: 3)
      scorecard1 = create(:scorecard, leaderboard_id: leaderboard1.id, new_course_id: course.id, tournament_round_id: tourn_round.id, user_id: user1.id, handicap: user1.handicap)
      user1_score1 = create(:user_score, hole_id: hole1.id, score: 4, scorecard_id: scorecard1.id, number: hole1.number)
      user1_score2 = create(:user_score, hole_id: hole2.id, score: 5, scorecard_id: scorecard1.id, number: hole2.number)

      scorecard2 = create(:scorecard, leaderboard_id: leaderboard2.id, new_course_id: course.id, tournament_round_id: tourn_round.id, user_id: user2.id, handicap: user2.handicap )
      user2_score1 = create(:user_score, hole_id: hole1.id, score: 4, scorecard_id: scorecard2.id, number: hole1.number)
      user2_score2 = create(:user_score, hole_id: hole2.id, score: 5, scorecard_id: scorecard2.id, number: hole2.number)
      user2_score3 = create(:user_score, hole_id: hole3.id, score: 3, scorecard_id: scorecard2.id, number: hole3.number)

      scorecard3 = create(:scorecard, leaderboard_id: leaderboard3.id, new_course_id: course.id, tournament_round_id: tourn_round.id, user_id: user3.id, handicap: user3.handicap )
      user3_score1 = create(:user_score, hole_id: hole1.id, score: 4, scorecard_id: scorecard3.id, number: hole1.number)
      user3_score2 = create(:user_score, hole_id: hole2.id, score: 5, scorecard_id: scorecard3.id, number: hole2.number)
      user3_score3 = create(:user_score, hole_id: hole3.id, score: 3, scorecard_id: scorecard3.id, number: hole3.number)

      expect(user1_score1.net).to eq(3)
      expect(user1_score2.net).to eq(5)
      expect(user2_score1.net).to eq(2)
      expect(user2_score2.net).to eq(4)
      expect(user2_score3.net).to eq(2)
      expect(user3_score1.net).to eq(2)
      expect(user3_score2.net).to eq(3)
      expect(user3_score3.net).to eq(2)
    end
  end

  describe "skins for" do
    it "should return list of scores for current users score hole number" do
      course = create(:new_course, name: 'The Course Too')
      course2 = create(:new_course, name: 'The Course Three')
      tourn_round = create(:tournament_round, tournament_id: tournament.id, new_course_id: course.id)
      tourn_round2 = create(:tournament_round, tournament_id: tournament.id, new_course_id: course2.id, round_number: 2)
      user1 = create(:user, handicap: 9)
      user2 = create(:user, handicap: 22)
      user3 = create(:user, handicap: 32)
      leaderboard1 = create(:leaderboard, tournament_id: tournament.id, user_id: user1.id)
      leaderboard2 = create(:leaderboard, tournament_id: tournament.id, user_id: user2.id)
      leaderboard3 = create(:leaderboard, tournament_id: tournament.id, user_id: user3.id)
      hole1 = create(:hole, new_course_id: course.id, par: 4, handicap: 4, number: 1)
      hole2 = create(:hole, new_course_id: course.id, par: 5, handicap: 14, number: 2)
      hole3 = create(:hole, new_course_id: course.id, par: 3, handicap: 18, number: 3)

      hole21 = create(:hole, new_course_id: course2.id, par: 4, handicap: 4, number: 1)
      hole22 = create(:hole, new_course_id: course2.id, par: 5, handicap: 14, number: 2)
      hole23 = create(:hole, new_course_id: course2.id, par: 3, handicap: 18, number: 3)

      scorecard1 = create(:scorecard, leaderboard_id: leaderboard1.id, new_course_id: course.id, tournament_round_id: tourn_round.id, user_id: user1.id, handicap: user1.handicap)
      user1_score1 = create(:user_score, hole_id: hole1.id, score: 4, scorecard_id: scorecard1.id, number: hole1.number)
      scorecard2 = create(:scorecard, leaderboard_id: leaderboard2.id, new_course_id: course.id, tournament_round_id: tourn_round.id, user_id: user2.id, handicap: user2.handicap )
      user2_score1 = create(:user_score, hole_id: hole1.id, score: 4, scorecard_id: scorecard2.id, number: hole1.number, net_skin: true)
      scorecard3 = create(:scorecard, leaderboard_id: leaderboard3.id, new_course_id: course.id, tournament_round_id: tourn_round.id, user_id: user3.id, handicap: user3.handicap )
      user3_score1 = create(:user_score, hole_id: hole1.id, score: 4, scorecard_id: scorecard3.id, number: hole1.number)

      scorecard21 = create(:scorecard, leaderboard_id: leaderboard1.id, new_course_id: course2.id, tournament_round_id: tourn_round2.id, user_id: user1.id, handicap: user1.handicap)
      create(:user_score, hole_id: hole21.id, score: 4, scorecard_id: scorecard21.id, number: hole21.number)
      scorecard22 = create(:scorecard, leaderboard_id: leaderboard2.id, new_course_id: course2.id, tournament_round_id: tourn_round2.id, user_id: user2.id, handicap: user2.handicap )
      create(:user_score, hole_id: hole21.id, score: 4, scorecard_id: scorecard22.id, number: hole21.number, net_skin: true)
      scorecard23 = create(:scorecard, leaderboard_id: leaderboard3.id, new_course_id: course2.id, tournament_round_id: tourn_round2.id, user_id: user3.id, handicap: user3.handicap )
      user3_score21 = create(:user_score, hole_id: hole21.id, score: 4, scorecard_id: scorecard23.id, number: hole21.number)

      scores = tourn_round.user_scores.skins_for(user3_score1.number, 'net_skin')

      expect(scores.size).to eq(3)
    end
  end
end
