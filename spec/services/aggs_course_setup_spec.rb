require 'rails_helper'

RSpec.describe Aggs::CourseSetup do
  let(:course) { create(:new_course, :bandon_trails)}
  it "should create aggs that correspond with the appropriate holes and course" do
    Aggs::CourseSetup.call(course.id)

    expect(course.course_agg).not_to be_nil
    expect(course.course_agg.hole_aggs.size).to eq(18)
    course.holes.each { |x| expect(HoleAgg.find_by(hole_id: x.id).present?).to eq(true) }
  end

end