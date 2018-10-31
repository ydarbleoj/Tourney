require'rails_helper'

RSpec.describe Leaderboards::SetSkin do
  let(:course) { create(:new_course, name: "The Course #{rand(1..99)}") }
  let(:tourn_round) { create(:tournament_round, new_course_id: course.id)}
  let(:user1) { create(:user, handicap: 9) }
  let(:user2) { create(:user, handicap: 22) }
  let(:user3) { create(:user, handicap: 32) }
  let(:hole1) { create(:hole, new_course_id: course.id, par: 4, handicap: 4, number: 1) }
  let(:hole2) { create(:hole, new_course_id: course.id, par: 5, handicap: 14, number: 2) }
  let(:hole3) { create(:hole, new_course_id: course.id, par: 3, handicap: 18, number: 3) }


  describe 'net skins' do
    it "should return update current skin winner to false upon tie" do
      scorecard1 = create(:scorecard, new_course_id: course.id, tournament_round_id: tourn_round.id, user_id: user1.id, handicap: user1.handicap)
      scorecard2 = create(:scorecard, new_course_id: course.id, tournament_round_id: tourn_round.id, user_id: user2.id, handicap: user2.handicap )
      scorecard3 = create(:scorecard, new_course_id: course.id, tournament_round_id: tourn_round.id, user_id: user3.id, handicap: user3.handicap )
      user1_score1 = create(:user_score, score: 4, scorecard_id: scorecard1.id, number: hole1.number, hole_id: hole1.id)
      user2_score1 = create(:user_score, score: 4, scorecard_id: scorecard2.id, number: hole1.number, hole_id: hole1.id, net_skin: true)
      user3_score1 = create(:user_score, score: 4, scorecard_id: scorecard3.id, number: hole1.number, hole_id: hole1.id)

      Leaderboards::SetSkin.call(user3_score1, 'net_skin')

      expect(scorecard3.reload.net_skin_total).to eq(0)
      expect(scorecard2.reload.net_skin_total).to eq(0)
      expect(user2_score1.reload.net_skin).to eq(false)
    end

    it "should update current user score to win skin and remove current skin" do
      scorecard1 = create(:scorecard, new_course_id: course.id, tournament_round_id: tourn_round.id, user_id: user1.id, handicap: user1.handicap)
      scorecard2 = create(:scorecard, new_course_id: course.id, tournament_round_id: tourn_round.id, user_id: user2.id, handicap: user2.handicap )
      scorecard3 = create(:scorecard, new_course_id: course.id, tournament_round_id: tourn_round.id, user_id: user3.id, handicap: user3.handicap )
      user1_score1 = create(:user_score, score: 4, scorecard_id: scorecard1.id, number: hole1.number, hole_id: hole1.id)
      user2_score1 = create(:user_score, score: 4, scorecard_id: scorecard2.id, number: hole1.number, hole_id: hole1.id, net_skin: true)
      user3_score1 = create(:user_score, score: 3, scorecard_id: scorecard3.id, number: hole1.number, hole_id: hole1.id)

      Leaderboards::SetSkin.call(user3_score1, 'net_skin')

      expect(scorecard3.reload.net_skin_total).to eq(1)
      expect(scorecard2.reload.net_skin_total).to eq(0)
      expect(user2_score1.reload.net_skin).to eq(false)
      expect(user3_score1.reload.net_skin).to eq(true)
    end

    it "should update lowest score -- which should be current -- to skimn win" do
      scorecard1 = create(:scorecard, new_course_id: course.id, tournament_round_id: tourn_round.id, user_id: user1.id, handicap: user1.handicap)
      scorecard2 = create(:scorecard, new_course_id: course.id, tournament_round_id: tourn_round.id, user_id: user2.id, handicap: user2.handicap )
      scorecard3 = create(:scorecard, new_course_id: course.id, tournament_round_id: tourn_round.id, user_id: user3.id, handicap: user3.handicap )
      user1_score1 = create(:user_score, score: 4, scorecard_id: scorecard1.id, number: hole1.number, hole_id: hole1.id)
      user2_score1 = create(:user_score, score: 4, scorecard_id: scorecard2.id, number: hole1.number, hole_id: hole1.id)
      user3_score1 = create(:user_score, score: 5, scorecard_id: scorecard3.id, number: hole1.number, hole_id: hole1.id)

      Leaderboards::SetSkin.call(user3_score1, 'net_skin')

      expect(scorecard2.reload.net_skin_total).to eq(1)
      expect(user2_score1.reload.net_skin).to eq(true)
      expect(user3_score1.reload.net_skin).to eq(false)
    end
  end
end