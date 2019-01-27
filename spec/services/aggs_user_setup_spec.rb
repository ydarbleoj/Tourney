require 'rails_helper'

RSpec.describe Aggs::UserSetup do
  let(:course) { create(:new_course, :bandon_trails)}


  it "should return a creaated tournament with rounds" do
    Aggs::CourseSetup.call(course.id)

    expect(course.course_agg).not_to be_nil
    expect(course.course_agg.hole_aggs.size).to eq(18)
  end

end