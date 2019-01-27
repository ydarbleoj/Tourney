require 'rails_helper'

RSpec.describe Scorecard, :type => :model do
  let(:course) { create(:new_course, name: "The Course #{rand(1..99)}") }
  let(:tourn_round) { create(:tournament_round, new_course_id: course.id)}
  let(:user1) { create(:user, handicap: 9) }
  let(:hole1) { create(:hole, new_course_id: course.id, par: 4, handicap: 4, number: 1) }
  let(:hole2) { create(:hole, new_course_id: course.id, par: 5, handicap: 14, number: 2) }
  let(:hole3) { create(:hole, new_course_id: course.id, par: 3, handicap: 18, number: 3) }

  describe 'update totals' do
    # it "should update after user score has been updated or saved" do
    #   scorecard1 = create(:scorecard, new_course_id: course.id, tournament_round_id: tourn_round.id, user_id: user1.id, handicap:)
    #   score1 = create(:user_score, score: 4, scorecard_id: scorecard1.id, number: hole1.number, par: hole1.par)
    #   score2 = create(:user_score, score: 4, scorecard_id: scorecard1.id, number: hole2.number, par: hole2.par, putts: 3)
    #   score3 = create(:user_score, score: 4, scorecard_id: scorecard1.id, number: hole3.number, par: hole3.par)

    #   scorecard1.update_totals
    #   sc = scorecard1.reload

    #   expect(sc.total_score).to eq(12)
    #   expect(sc.total_net).to eq(11)
    #   expect(sc.total_putts).to eq(7)
    #   expect(sc.total_3putts).to eq(1)
    # end
  end

  describe "hole averages" do
    it "should return hole avgs" do
      user = create(:user)
      course = create(:new_course, :bandon_trails)
      tourn = create(:tournament)
      tourn_round = create(:tournament_round, new_course_id: course.id, tournament_id: tourn.id, round_number: 1)
      leaderboard = create(:leaderboard, tournament_id: tourn.id, user_id: user.id, handicap: 9)
      tourn2 = create(:tournament)
      tourn_round2 = create(:tournament_round, new_course_id: course.id, tournament_id: tourn.id, round_number: 1)
      leaderboard2 = create(:leaderboard, tournament_id: tourn2.id, user_id: user.id, handicap: 9)
      tourn3 = create(:tournament)
      tourn_round3 = create(:tournament_round, new_course_id: course.id, tournament_id: tourn3.id, round_number: 1)
      leaderboard3 = create(:leaderboard, tournament_id: tourn3.id, user_id: user.id, handicap: 9)

      scorecard = create(:scorecard, :low_scores, tournament_round_id: tourn_round.id, leaderboard_id: leaderboard.id, user_id: user.id, new_course_id: course.id, handicap: leaderboard.handicap)
      scorecard = create(:scorecard, :mid_scores, tournament_round_id: tourn_round2.id, leaderboard_id: leaderboard2.id, user_id: user.id, new_course_id: course.id, handicap: leaderboard2.handicap)
      scorecard = create(:scorecard, :mid_scores, tournament_round_id: tourn_round3.id, leaderboard_id: leaderboard3.id, user_id: user.id, new_course_id: course.id, handicap: leaderboard3.handicap)

      hole1 = course.holes.find_by_number(1)
      arr = Scorecard.hole_averages(user.id, course.id, hole1.id)
      print arr.as_json
    end
  end

end
