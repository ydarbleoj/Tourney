module Aggs
  class CourseSetup

    def self.call(course_id)
      new(course_id).call
    end

    def initialize(course_id)
      @course     = NewCourse.includes(:holes).find(course_id)
      @course_agg = create_course_agg
    end

    def call
      return false if course_agg.blank?
      ActiveRecord::Base.transaction do
        course.holes.each { |x| HoleAgg.find_or_create_by(hole_id: x.id, course_agg_id: course_agg.id, par: x.par) }
      end
    end

    private
    attr_reader :course_agg, :course
    def create_course_agg
      CourseAgg.find_or_create_by(new_course_id: course.id)
    end
  end
end