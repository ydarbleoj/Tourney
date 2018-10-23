require 'rails_helper'

RSpec.describe Scorecard, :type => :model do
  let(:course) { create(:new_course, name: "The Course #{rand(1..99)}") }
  let(:tourn_round) { create(:tournament_round, new_course_id: course.id)}
  let(:user1) { create(:user, handicap: 9) }
  let(:hole1) { create(:hole, new_course_id: course.id, par: 4, handicap: 4, number: 1) }
  let(:hole2) { create(:hole, new_course_id: course.id, par: 5, handicap: 14, number: 2) }
  let(:hole3) { create(:hole, new_course_id: course.id, par: 3, handicap: 18, number: 3) }

  describe 'update totals' do
    it "should update after user score has been updated or saved" do
      scorecard1 = create(:scorecard, new_course_id: course.id, tournament_round_id: tourn_round.id, user_id: user1.id, handicap: user1.handicap)
      score1 = create(:user_score, score: 4, scorecard_id: scorecard1.id, number: hole1.number, par: hole1.par)
      score2 = create(:user_score, score: 4, scorecard_id: scorecard1.id, number: hole2.number, par: hole2.par, putts: 3)
      score3 = create(:user_score, score: 4, scorecard_id: scorecard1.id, number: hole3.number, par: hole3.par)

      scorecard1.update_totals
      sc = scorecard1.reload

      expect(sc.total_score).to eq(12)
      expect(sc.total_net).to eq(11)
      expect(sc.total_putts).to eq(7)
      expect(sc.total_3putts).to eq(1)
    end
  end

end
