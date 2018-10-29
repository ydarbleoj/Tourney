require 'rails_helper'

RSpec.describe Leaderboard, :type => :model do
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

  describe "update_totals" do
    it "should return partial first round totals" do
      leaderboard = create(:leaderboard, tournament_id: tourn_round.tournament_id, user_id: user1.id, handicap: user1.handicap)
      scorecard1 = create(:scorecard, new_course_id: course.id, round_num: tourn_round.round_number,
        tournament_round_id: tourn_round.id, user_id: user1.id, handicap: user1.handicap, leaderboard_id: leaderboard.id)
      create(:user_score, score: 4, scorecard_id: scorecard1.id, number: hole1.number, par: hole1.par)
      create(:user_score, score: 4, scorecard_id: scorecard1.id, number: hole2.number, par: hole2.par, putts: 3)
      create(:user_score, score: 4, scorecard_id: scorecard1.id, number: hole3.number, par: hole3.par)

      totals = leaderboard.scorecard_totals
      expect(totals['total_3_putts']).to eq(1)
      expect(totals['net_total']).to eq(11)
      expect(totals['total_putts']).to eq(7)
    end

    it "should return partial first round totals" do
      leaderboard = create(:leaderboard, tournament_id: tourn_round.tournament_id, user_id: user1.id, handicap: user1.handicap)
      scorecard1 = create(:scorecard, new_course_id: course.id, round_num: tourn_round.round_number,
        tournament_round_id: tourn_round.id, user_id: user1.id, handicap: user1.handicap, leaderboard_id: leaderboard.id,
        total_score: 80, total_putts: 29, total_3putts: 1, total_net: 72)

      totals = leaderboard.scorecard_totals
      expect(totals['total_3_putts']).to eq(1)
      expect(totals['net_total']).to eq(72)
      expect(totals['total_putts']).to eq(29)
    end

    it "should return partial of second round added to first round totals" do
      leaderboard = create(:leaderboard, tournament_id: tourn_round.tournament_id, user_id: user1.id, handicap: user1.handicap)
      scorecard1 = create(:scorecard, new_course_id: course.id, round_num: tourn_round.round_number,
        tournament_round_id: tourn_round.id, user_id: user1.id, handicap: user1.handicap, leaderboard_id: leaderboard.id,
        total_score: 80, total_putts: 29, total_3putts: 1, total_net: 72)

      scorecard2 = create(:scorecard, new_course_id: course2.id, round_num: tourn_round2.round_number,
        tournament_round_id: tourn_round2.id, user_id: user1.id, handicap: user1.handicap, leaderboard_id: leaderboard.id)
      create(:user_score, score: 4, scorecard_id: scorecard2.id, number: hole21.number, par: hole21.par)
      create(:user_score, score: 4, scorecard_id: scorecard2.id, number: hole22.number, par: hole22.par, putts: 3)
      create(:user_score, score: 4, scorecard_id: scorecard2.id, number: hole23.number, par: hole23.par)

      totals = leaderboard.scorecard_totals
      expect(totals['total_3_putts']).to eq(2)
      expect(totals['net_total']).to eq(83)
      expect(totals['total_putts']).to eq(36)
    end

  end

  describe "current_total_score" do
    it "should return total score" do
      leaderboard = create(:leaderboard, tournament_id: tourn_round.tournament_id, user_id: user1.id, handicap: user1.handicap)
      scorecard1 = create(:scorecard, new_course_id: course.id, round_num: tourn_round.round_number,
        tournament_round_id: tourn_round.id, user_id: user1.id, handicap: user1.handicap, leaderboard_id: leaderboard.id,
        total_score: 80, total_putts: 29, total_3putts: 1, total_net: 71, finished: true)

      num = leaderboard.current_total_score
      expect(num).to eq(-1)
    end
  end
end
