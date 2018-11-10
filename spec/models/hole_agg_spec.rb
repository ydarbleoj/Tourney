require 'rails_helper'

RSpec.describe HoleAgg, type: :model do
  let(:course) { create(:new_course) }
  let(:course_agg) { create(:course_agg, new_course_id: course.id) }
  let(:hole1) { create(:hole, new_course_id: course.id, par: 4, handicap: 4, number: 1) }
  let(:hole2) { create(:hole, new_course_id: course.id, par: 5, handicap: 7, number: 3) }
  let(:hole_agg) { create(:hole_agg, course_agg_id: course_agg.id, hole_id: hole1.id, par: hole1.par, count: 6) }
  let(:user1) { create(:user, handicap: 9) }
  let(:user2) { create(:user, handicap: 12) }


  describe "user hole avgs" do
    it "should return correct avgs" do
      user_course_agg1 = create(:user_course_agg, user_id: user1.id, new_course_id: course.id)
      user_course_agg2 = create(:user_course_agg, user_id: user2.id, new_course_id: course.id)
      create(:user_hole_agg, user_id: user1.id, hole_id: hole1.id, net_avg: 4.4, gross_avg: 5.4, putts_avg: 2.4, count: 2, greens_in_reg: 0.25, three_putts_avg: 0.5, user_course_agg_id: user_course_agg1.id)
      create(:user_hole_agg, user_id: user1.id, hole_id: hole2.id, net_avg: 5.4, gross_avg: 6.4, putts_avg: 1.5, count: 2, greens_in_reg: 0.50, three_putts_avg: 0.0, user_course_agg_id: user_course_agg1.id)
      create(:user_hole_agg, user_id: user2.id, hole_id: hole1.id, net_avg: 4.8, gross_avg: 5.8, putts_avg: 2.4, count: 4, greens_in_reg: 0.25, three_putts_avg: 0.3, user_course_agg_id: user_course_agg2.id)

      avgs = hole_agg.user_hole_avgs

      expect(avgs['count'].to_f.round(1)).to eq(6.0)
      expect(avgs['net_avg'].to_f.round(1)).to eq(4.7)
      expect(avgs['gross_avg'].to_f.round(1)).to eq(5.7)
      expect(avgs['putts_avg'].to_f.round(1)).to eq(2.4)
      expect(avgs['three_putts_avg'].to_f.round(1)).to eq(0.4)
      expect(avgs['greens_in_reg'].to_f.round(1)).to eq(0.3)
    end
  end
end
