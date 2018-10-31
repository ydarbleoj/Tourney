require'rails_helper'

RSpec.describe Leaderboards::Scoring do

  describe 'call' do
    let(:tournament) { create(:tournament) }
    let(:course) { create(:new_course, name: "The Course #{rand(1..99)}") }
    let(:tourn_round) { create(:tournament_round, new_course_id: course.id, round_number: 1, tournament_id: tournament.id) }
    let(:user1) { create(:user, handicap: 9) }
    let(:user2) { create(:user, handicap: 12) }
    let(:user3) { create(:user, handicap: 19) }
    let(:user4) { create(:user, handicap: 3) }

    let(:hole1) { create(:hole, new_course_id: course.id, par: 4, handicap: 4, number: 1) }
    let(:hole2) { create(:hole, new_course_id: course.id, par: 5, handicap: 14, number: 2) }
    let(:hole3) { create(:hole, new_course_id: course.id, par: 3, handicap: 18, number: 3) }
    let(:hole4) { create(:hole, new_course_id: course.id, par: 4, handicap: 1, number: 4) }
    let(:hole5) { create(:hole, new_course_id: course.id, par: 5, handicap: 12, number: 5) }
    let(:hole6) { create(:hole, new_course_id: course.id, par: 3, handicap: 15, number: 6) }
    let(:hole7) { create(:hole, new_course_id: course.id, par: 4, handicap: 2, number: 7) }
    let(:hole8) { create(:hole, new_course_id: course.id, par: 5, handicap: 3, number: 8) }
    let(:hole9) { create(:hole, new_course_id: course.id, par: 3, handicap: 17, number: 9) }

    it "leaderboard model should reflect the appropriate totals after 1st round" do
      leaderboard1 = create(:leaderboard, tournament_id: tourn_round.tournament_id, user_id: user1.id, handicap: user1.handicap)
      leaderboard2 = create(:leaderboard, tournament_id: tourn_round.tournament_id, user_id: user2.id, handicap: user2.handicap)
      leaderboard3 = create(:leaderboard, tournament_id: tourn_round.tournament_id, user_id: user3.id, handicap: user3.handicap)
      leaderboard4 = create(:leaderboard, tournament_id: tourn_round.tournament_id, user_id: user4.id, handicap: user4.handicap)

      scorecard1 = create(:scorecard, new_course_id: course.id, round_num: tourn_round.round_number,
        tournament_round_id: tourn_round.id, user_id: user1.id, handicap: user1.handicap, leaderboard_id: leaderboard1.id)
      scorecard2 = create(:scorecard, new_course_id: course.id, round_num: tourn_round.round_number,
        tournament_round_id: tourn_round.id, user_id: user2.id, handicap: user2.handicap, leaderboard_id: leaderboard2.id)
      scorecard3 = create(:scorecard, new_course_id: course.id, round_num: tourn_round.round_number,
        tournament_round_id: tourn_round.id, user_id: user1.id, handicap: user1.handicap, leaderboard_id: leaderboard3.id)
      scorecard4 = create(:scorecard, new_course_id: course.id, round_num: tourn_round.round_number,
        tournament_round_id: tourn_round.id, user_id: user1.id, handicap: user1.handicap, leaderboard_id: leaderboard4.id)

      create(:user_score, score: 4, scorecard_id: scorecard1.id, number: hole1.number, hole_id: hole1.id)
      create(:user_score, score: 4, scorecard_id: scorecard2.id, number: hole1.number, hole_id: hole1.id, putts: 3)
      create(:user_score, score: 4, scorecard_id: scorecard3.id, number: hole1.number, hole_id: hole1.id)
      user_score = create(:user_score, score: 4, scorecard_id: scorecard4.id, number: hole1.number, hole_id: hole1.id)


      res = Leaderboards::Scoring.call(user_score.id)
      expect(res).to eq(true)
    end

  end

end