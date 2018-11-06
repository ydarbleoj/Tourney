require 'rails_helper'

RSpec.describe UserHoleAgg, type: :model do
  let(:user1) { create(:user, handicap: 9) }
  let(:user2) { create(:user, handicap: 12) }
  let(:course) { create(:new_course, name: "The Course #{rand(1..99)}") }
  let(:hole1) { create(:hole, new_course_id: course.id, par: 4, handicap: 4, number: 1) }

  let(:tournament1) { create(:tournament) }
  let(:tournament2) { create(:tournament) }
  let(:tournament3) { create(:tournament) }

  let(:tourn_round1) { create(:tournament_round, new_course_id: course.id, round_number: 1, tournament_id: tournament1.id) }
  let(:tourn_round2) { create(:tournament_round, new_course_id: course.id, round_number: 2, tournament_id: tournament2.id) }
  let(:tourn_round3) { create(:tournament_round, new_course_id: course.id, round_number: 3, tournament_id: tournament3.id) }
  let(:leaderboard1) { create(:leaderboard, tournament_id: tournament1.id, user_id: user1.id, handicap: user1.handicap) }
  let(:leaderboard2) { create(:leaderboard, tournament_id: tournament2.id, user_id: user1.id, handicap: user1.handicap) }
  let(:leaderboard3) { create(:leaderboard, tournament_id: tournament3.id, user_id: user1.id, handicap: user1.handicap) }

  let(:leaderboard21) { create(:leaderboard, tournament_id: tournament1.id, user_id: user2.id, handicap: user2.handicap) }
  let(:leaderboard22) { create(:leaderboard, tournament_id: tournament2.id, user_id: user2.id, handicap: user2.handicap) }
  let(:leaderboard23) { create(:leaderboard, tournament_id: tournament3.id, user_id: user2.id, handicap: user2.handicap) }

  describe 'total hole averages' do
    it 'should return correct avgs' do
      scorecard1 = create(:scorecard, new_course_id: course.id, round_num: tourn_round1.round_number, tournament_round_id: tourn_round1.id, user_id: user1.id, handicap: user1.handicap, leaderboard_id: leaderboard1.id)
      scorecard2 = create(:scorecard, new_course_id: course.id, round_num: tourn_round2.round_number, tournament_round_id: tourn_round2.id, user_id: user1.id, handicap: user1.handicap, leaderboard_id: leaderboard2.id)
      scorecard3 = create(:scorecard, new_course_id: course.id, round_num: tourn_round3.round_number, tournament_round_id: tourn_round3.id, user_id: user1.id, handicap: user1.handicap, leaderboard_id: leaderboard3.id)

      create(:user_score, scorecard_id: scorecard1.id, putts: 2, score: 6, hole_id: hole1.id)
      create(:user_score, scorecard_id: scorecard2.id, putts: 3, score: 6, hole_id: hole1.id)
      create(:user_score, scorecard_id: scorecard3.id, putts: 2, score: 4, hole_id: hole1.id)

      scorecard21 = create(:scorecard, new_course_id: course.id, round_num: tourn_round1.round_number, tournament_round_id: tourn_round1.id, user_id: user2.id, handicap: user2.handicap, leaderboard_id: leaderboard1.id)
      scorecard22 = create(:scorecard, new_course_id: course.id, round_num: tourn_round2.round_number, tournament_round_id: tourn_round2.id, user_id: user2.id, handicap: user2.handicap, leaderboard_id: leaderboard2.id)
      scorecard23 = create(:scorecard, new_course_id: course.id, round_num: tourn_round3.round_number, tournament_round_id: tourn_round3.id, user_id: user2.id, handicap: user2.handicap, leaderboard_id: leaderboard3.id)

      create(:user_score, scorecard_id: scorecard21.id, putts: 2, score: 5, hole_id: hole1.id)
      create(:user_score, scorecard_id: scorecard22.id, putts: 1, score: 4, hole_id: hole1.id)
      create(:user_score, scorecard_id: scorecard23.id, putts: 2, score: 5, hole_id: hole1.id)

      agg = UserHoleAgg.create(user_id: user1.id, hole_id: hole1.id, par: hole1.par)
      aa = agg.averages_for(hole1.id)[0].attributes

      expect(aa['count']).to eq(3)
      expect(aa['net_avg'].to_f.round(1)).to eq(4.3)
      expect(aa['gross_avg'].to_f.round(1)).to eq(5.3)
      expect(aa['putts_avg'].to_f.round(1)).to eq(2.3)
      expect(aa['three_putts_avg'].to_f.round(1)).to eq(0.3)
      expect(aa['greens_in_reg'].to_f.round(1)).to eq(0.3)

      agg2 = UserHoleAgg.create(user_id: user2.id, hole_id: hole1.id, par: hole1.par)
      aa2 = agg2.averages_for(hole1.id)[0].attributes

      expect(aa2['count']).to eq(3)
      expect(aa2['net_avg'].to_f.round(1)).to eq(3.7)
      expect(aa2['gross_avg'].to_f.round(1)).to eq(4.7)
      expect(aa2['putts_avg'].to_f.round(1)).to eq(1.7)
      expect(aa2['three_putts_avg'].to_f.round(1)).to eq(0)
      expect(aa2['greens_in_reg'].to_f.round(1)).to eq(0)
    end
  end
end
