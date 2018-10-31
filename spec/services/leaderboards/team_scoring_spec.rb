require'rails_helper'

RSpec.describe Leaderboards::TeamScoring do

  describe 'call' do
    let(:tournament) { create(:tournament) }
    let(:course) { create(:new_course, name: "The Course #{rand(1..99)}") }
    let(:tourn_round) { create(:tournament_round, new_course_id: course.id, round_number: 1, tournament_id: tournament.id) }
    let(:user1) { create(:user, handicap: 9) }
    let(:user2) { create(:user, handicap: 15) }
    let(:user3) { create(:user, handicap: 32) }
    let(:user4) { create(:user, handicap: 22) }
    let(:user5) { create(:user, handicap: 22) }
    let(:hole1) { create(:hole, new_course_id: course.id, par: 4, handicap: 4, number: 1) }
    let(:hole2) { create(:hole, new_course_id: course.id, par: 5, handicap: 14, number: 2) }
    let(:hole3) { create(:hole, new_course_id: course.id, par: 3, handicap: 18, number: 3) }

    it "leaderboard model should reflect the appropriate totals after 1st round" do
      team_scorecard = create(:team_scorecard, tournament_round_id: tourn_round.id, group: 'A', new_course_id: course.id)
      team_scorecard2 = create(:team_scorecard, tournament_round_id: tourn_round.id, group: 'B', new_course_id: course.id)
      create(:tee_time, user_id: user1.id, tournament_round_id: tourn_round.id, group: 'A', tee_time: DateTime.now, team_scorecard_id: team_scorecard.id)
      create(:tee_time, user_id: user2.id, tournament_round_id: tourn_round.id, group: 'A', tee_time: DateTime.now, team_scorecard_id: team_scorecard.id)
      create(:tee_time, user_id: user3.id, tournament_round_id: tourn_round.id, group: 'A', tee_time: DateTime.now, team_scorecard_id: team_scorecard.id)
      create(:tee_time, user_id: user4.id, tournament_round_id: tourn_round.id, group: 'A', tee_time: DateTime.now, team_scorecard_id: team_scorecard.id)
      create(:tee_time, user_id: user5.id, tournament_round_id: tourn_round.id, group: 'B', tee_time: DateTime.now - 10.minutes, team_scorecard_id: team_scorecard2.id)
      leaderboard1 = create(:leaderboard, tournament_id: tourn_round.tournament_id, user_id: user1.id, handicap: user1.handicap)
      leaderboard2 = create(:leaderboard, tournament_id: tourn_round.tournament_id, user_id: user2.id, handicap: user2.handicap)
      leaderboard3 = create(:leaderboard, tournament_id: tourn_round.tournament_id, user_id: user3.id, handicap: user3.handicap)
      leaderboard4 = create(:leaderboard, tournament_id: tourn_round.tournament_id, user_id: user4.id, handicap: user4.handicap)
      leaderboard5 = create(:leaderboard, tournament_id: tourn_round.tournament_id, user_id: user5.id, handicap: user5.handicap)

      scorecard1 = create(:scorecard, new_course_id: course.id, round_num: tourn_round.round_number,
        tournament_round_id: tourn_round.id, user_id: user1.id, handicap: user1.handicap, leaderboard_id: leaderboard1.id)
      scorecard2 = create(:scorecard, new_course_id: course.id, round_num: tourn_round.round_number,
        tournament_round_id: tourn_round.id, user_id: user2.id, handicap: user2.handicap, leaderboard_id: leaderboard2.id)
      scorecard3 = create(:scorecard, new_course_id: course.id, round_num: tourn_round.round_number,
        tournament_round_id: tourn_round.id, user_id: user3.id, handicap: user3.handicap, leaderboard_id: leaderboard3.id)
      scorecard4 = create(:scorecard, new_course_id: course.id, round_num: tourn_round.round_number,
        tournament_round_id: tourn_round.id, user_id: user4.id, handicap: user4.handicap, leaderboard_id: leaderboard4.id)
      scorecard5 = create(:scorecard, new_course_id: course.id, round_num: tourn_round.round_number,
        tournament_round_id: tourn_round.id, user_id: user5.id, handicap: user5.handicap, leaderboard_id: leaderboard5.id)


      create(:user_score, score: 3, scorecard_id: scorecard1.id, number: hole1.number, hole_id: hole1.id)
      # create(:user_score, score: 4, scorecard_id: scorecard1.id, number: hole2.number, hole_id: hole2.id, putts: 3)
      # create(:user_score, score: 4, scorecard_id: scorecard1.id, number: hole3.number, hole_id: hole3.id)
      create(:user_score, score: 5, scorecard_id: scorecard2.id, number: hole1.number, hole_id: hole1.id)
      # create(:user_score, score: 4, scorecard_id: scorecard1.id, number: hole2.number, hole_id: hole2.id, putts: 3)
      # create(:user_score, score: 4, scorecard_id: scorecard1.id, number: hole3.number, hole_id: hole3.id)
      create(:user_score, score: 4, scorecard_id: scorecard3.id, number: hole1.number, hole_id: hole1.id)
      # create(:user_score, score: 4, scorecard_id: scorecard1.id, number: hole2.number, hole_id: hole2.id, putts: 3)
      # create(:user_score, score: 4, scorecard_id: scorecard1.id, number: hole3.number, hole_id: hole3.id)
      user_score4 = create(:user_score, score: 4, scorecard_id: scorecard4.id, number: hole1.number, hole_id: hole1.id)
      user_score5 = create(:user_score, score: 3, scorecard_id: scorecard5.id, number: hole1.number, hole_id: hole1.id)
      # create(:user_score, score: 4, scorecard_id: scorecard1.id, number: hole2.number, hole_id: hole2.id, putts: 3)
      # user_score4 = create(:user_score, score: 4, scorecard_id: scorecard1.id, number: hole3.number, hole_id: hole3.id)

      Leaderboards::TeamScoring.call(user_score4)
      team_sc = team_scorecard.reload

      expect(team_sc.total_net).to eq(4)
      expect(team_sc.team_scores.first.net).to eq(4)

    end

  end

end