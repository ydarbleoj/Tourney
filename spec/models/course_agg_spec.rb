require 'rails_helper'

RSpec.describe CourseAgg, type: :model do
  let(:course) { create(:new_course, name: "The Course #{rand(1..99)}") }
  let(:course_agg) { create(:course_agg, new_course_id: course.id) }
  let(:hole1) { create(:hole, new_course_id: course.id, par: 4, handicap: 4, number: 1) }
  let(:hole2) { create(:hole, new_course_id: course.id, par: 4, handicap: 7, number: 3) }
  let(:hole3) { create(:hole, new_course_id: course.id, par: 5, handicap: 8, number: 2) }
  let(:hole4) { create(:hole, new_course_id: course.id, par: 5, handicap: 9, number: 4) }

  describe 'hole averages' do
    it "should return correct avgs" do
      HoleAgg.create(course_agg_id: course_agg.id, hole_id: hole1.id, par: hole1.par, net_avg: 3.5, gross_avg: 4.5, putts_avg: 2.1)
      HoleAgg.create(course_agg_id: course_agg.id, hole_id: hole2.id, par: hole2.par, net_avg: 4.2, gross_avg: 5.2, putts_avg: 1.9)
      HoleAgg.create(course_agg_id: course_agg.id, hole_id: hole3.id, par: hole3.par, net_avg: 5.2, gross_avg: 6.2, putts_avg: 3.1)
      HoleAgg.create(course_agg_id: course_agg.id, hole_id: hole4.id, par: hole4.par, net_avg: 4.4, gross_avg: 5.4, putts_avg: 1.5)

p      arg = course_agg.hole_averages[0].attributes

      # expect(arg[4].to_f.round(1)).to eq(3.9)
      # expect(arg[5].to_f.round(1)).to eq(4.8)
    end
  end

end
