require 'rails_helper'

RSpec.describe UserScore, :type => :model do
  let(:course) { create(:new_course) }
  let(:tourn_round) { create(:tournament_round, new_course_id: course.id)}
  let(:user1) { create(:user, handicap: 9) }
  let(:user2) { create(:user, handicap: 22) }
  let(:user3) { create(:user, handicap: 32) }
  let(:hole1) { create(:hole, new_course_id: course.id, par: 4, handicap: 4, number: 1) }
  let(:hole2) { create(:hole, new_course_id: course.id, par: 5, handicap: 14, number: 2) }
  let(:hole3) { create(:hole, new_course_id: course.id, par: 3, handicap: 18, number: 3) }


  describe "calculate_net" do
    it "should return correct net score below 18 handicap" do
      scorecard1 = create(:scorecard, new_course_id: course.id, tournament_round_id: tourn_round.id, user_id: user1.id, handicap: user1.handicap)
      user1_score1 = create(:user_score, score: 4, scorecard_id: scorecard1.id, number: hole1.number, par: hole1.par)
      user1_score2 = create(:user_score, score: 5, scorecard_id: scorecard1.id, number: hole2.number, par: hole2.par, handicap: user1.handicap)

      scorecard2 = create(:scorecard, new_course_id: course.id, tournament_round_id: tourn_round.id, user_id: user2.id, handicap: user2.handicap )
      user2_score1 = create(:user_score, score: 4, scorecard_id: scorecard2.id, number: hole1.number, par: hole1.par)
      user2_score2 = create(:user_score, score: 5, scorecard_id: scorecard2.id, number: hole2.number, par: hole2.par, handicap: user2.handicap)
      user2_score3 = create(:user_score, score: 3, scorecard_id: scorecard2.id, number: hole3.number, par: hole3.par, handicap: user2.handicap)

      scorecard3 = create(:scorecard, new_course_id: course.id, tournament_round_id: tourn_round.id, user_id: user3.id, handicap: user3.handicap )
      user3_score1 = create(:user_score, score: 4, scorecard_id: scorecard3.id, number: hole1.number, par: hole1.par)
      user3_score2 = create(:user_score, score: 5, scorecard_id: scorecard3.id, number: hole2.number, par: hole2.par, handicap: user3.handicap)
      user3_score3 = create(:user_score, score: 3, scorecard_id: scorecard3.id, number: hole3.number, par: hole3.par, handicap: user3.handicap)

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

  describe "current skin" do
    it "should return user score wher skin true net" do
      scorecard1 = create(:scorecard, new_course_id: course.id, tournament_round_id: tourn_round.id, user_id: user1.id, handicap: user1.handicap)
      user1_score1 = create(:user_score, score: 4, scorecard_id: scorecard1.id, number: hole1.number, par: hole1.par, )
      scorecard2 = create(:scorecard, new_course_id: course.id, tournament_round_id: tourn_round.id, user_id: user2.id, handicap: user2.handicap )
      user2_score1 = create(:user_score, score: 4, scorecard_id: scorecard2.id, number: hole1.number, par: hole1.par)

      p scores = tourn_round.user_scores.current_skin(user2_score1.number, 'net')

    end
  end
end
