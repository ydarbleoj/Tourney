require'rails_helper'

RSpec.describe Scoreboard::Updates do

  describe 'call' do
    let(:tournament) { create(:tournament) }
    let(:course) { create(:new_course, name: "The Course #{rand(1..99)}") }
    let(:course2) { create(:new_course, name: "The Course #{rand(1..99)}") }
    let(:course3) { create(:new_course, name: "The Course #{rand(1..99)}") }
    let(:tourn_round) { create(:tournament_round, new_course_id: course.id, round_number: 1, tournament_id: tournament.id) }
    let(:tourn_round2) { create(:tournament_round, new_course_id: course2.id, round_number: 2, tournament_id: tournament.id) }
    let(:tourn_round3) { create(:tournament_round, new_course_id: course3.id, round_number: 3, tournament_id: tournament.id) }
    let(:user1) { create(:user, handicap: 9) }
    let(:hole1) { create(:hole, new_course_id: course.id, par: 4, handicap: 4, number: 1) }
    let(:hole2) { create(:hole, new_course_id: course.id, par: 5, handicap: 14, number: 2) }
    let(:hole3) { create(:hole, new_course_id: course.id, par: 3, handicap: 18, number: 3) }
    let(:hole21) { create(:hole, new_course_id: course2.id, par: 4, handicap: 4, number: 1) }
    let(:hole22) { create(:hole, new_course_id: course2.id, par: 5, handicap: 14, number: 2) }
    let(:hole23) { create(:hole, new_course_id: course2.id, par: 3, handicap: 18, number: 3) }
    let(:hole31) { create(:hole, new_course_id: course3.id, par: 4, handicap: 4, number: 1) }
    let(:hole32) { create(:hole, new_course_id: course3.id, par: 5, handicap: 14, number: 2) }
    let(:hole33) { create(:hole, new_course_id: course3.id, par: 3, handicap: 18, number: 3) }

    it "leaderboard model should reflect the appropriate totals after 1st round" do
      leaderboard = create(:leaderboard, tournament_id: tourn_round.tournament_id, user_id: user1.id, handicap: user1.handicap)
      scorecard1 = create(:scorecard, new_course_id: course.id, round_num: tourn_round.round_number,
        tournament_round_id: tourn_round.id, user_id: user1.id, handicap: user1.handicap, leaderboard_id: leaderboard.id)
      create(:user_score, score: 4, scorecard_id: scorecard1.id, number: hole1.number, hole_id: hole1.id)
      create(:user_score, score: 4, scorecard_id: scorecard1.id, number: hole2.number, hole_id: hole2.id, putts: 3)
      create(:user_score, score: 4, scorecard_id: scorecard1.id, number: hole3.number, hole_id: hole3.id)

      Scoreboard::Updates.call(leaderboard.id)
      lb = leaderboard.reload

      expect(lb.net_total).to eq(11)
      expect(lb.total_putts).to eq(7)
      expect(lb.total_3_putts).to eq(1)
      expect(lb.total_score).to eq(-1)
    end

    it "leaderboard model should reflect the appropriate totals after 2nd round" do
      leaderboard2 = create(:leaderboard, tournament_id: tourn_round.tournament_id, user_id: user1.id, handicap: user1.handicap,
        total_score: 8, total_putts: 30, total_3_putts: 2, net_total: 79)
      create(:scorecard, leaderboard_id: leaderboard2.id, user_id: user1.id, tournament_round_id: tourn_round.id,
        total_score: 88, total_putts: 30, total_3putts: 2, new_course_id: tourn_round.new_course_id, total_net: 79, handicap: user1.handicap,
        round_num: 1, finished: true)
      scorecard2 = create(:scorecard, new_course_id: course2.id, round_num: tourn_round2.round_number,
        tournament_round_id: tourn_round2.id, user_id: user1.id, handicap: user1.handicap, leaderboard_id: leaderboard2.id)
      create(:user_score, score: 4, scorecard_id: scorecard2.id, number: hole21.number, hole_id: hole21.id)
      create(:user_score, score: 4, scorecard_id: scorecard2.id, number: hole22.number, hole_id: hole22.id, putts: 3)
      create(:user_score, score: 4, scorecard_id: scorecard2.id, number: hole23.number, hole_id: hole23.id)

      Leaderboards::Updates.call(leaderboard2.id)
      lb = leaderboard2.reload

      expect(lb.net_total).to eq(90)
      expect(lb.total_putts).to eq(37)
      expect(lb.total_3_putts).to eq(3)
      expect(lb.total_score).to eq(6)
    end

    it "leaderboard model should reflect the appropriate totals after 3nd round" do
      leaderboard = create(:leaderboard, tournament_id: tourn_round.tournament_id, user_id: user1.id, handicap: user1.handicap,
        total_score: 10, total_putts: 59, total_3_putts: 3, net_total: 153)
      create(:scorecard, leaderboard_id: leaderboard.id, user_id: user1.id, tournament_round_id: tourn_round.id,
        total_score: 88, total_putts: 30, total_3putts: 2, new_course_id: tourn_round.new_course_id, total_net: 79, handicap: user1.handicap,
        round_num: 1, finished: true)
      create(:scorecard, leaderboard_id: leaderboard.id, user_id: user1.id, tournament_round_id: tourn_round2.id,
        total_score: 83, total_putts: 29, total_3putts: 1, new_course_id: tourn_round2.new_course_id, total_net: 74, handicap: user1.handicap,
        round_num: 2, finished: true)

      scorecard3 = create(:scorecard, new_course_id: course3.id, round_num: tourn_round3.round_number,
        tournament_round_id: tourn_round3.id, user_id: user1.id, handicap: user1.handicap, leaderboard_id: leaderboard.id)
      create(:user_score, score: 4, scorecard_id: scorecard3.id, number: hole31.number, hole_id: hole31.id)
      create(:user_score, score: 4, scorecard_id: scorecard3.id, number: hole32.number, hole_id: hole32.id, putts: 3)
      create(:user_score, score: 4, scorecard_id: scorecard3.id, number: hole33.number, hole_id: hole33.id)


      Leaderboards::Updates.call(leaderboard.id)
      lb = leaderboard.reload

      expect(lb.net_total).to eq(164)
      expect(lb.total_putts).to eq(66)
      expect(lb.total_3_putts).to eq(4)
      expect(lb.total_score).to eq(8)
    end
  end

end