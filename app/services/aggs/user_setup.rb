module Aggs
  class UserSetup
    attr_accessor :user, :course_ids

    def self.call(user_id, course_ids)
      new(user_id, course_ids).call
    end

    def initialize(user_id, course_ids)
      @course_ids = course_ids
      @courses    = []
      @user       = User.find(user_id)
    end

    def call
      course_list
      @courses.each { |x| set_holes(x) }
    end

    private
    def course_list
      course_ids.each do |x|
        @courses << NewCourse.includes(:holes).find(x)
      end
    end

    def set_holes(course)
      course_agg = UserCourseAgg.where(new_course_id: course.id, user_id: user.id).first_or_create
      course.holes.each { |x| Aggs::HoleProcess.call(user.id, course_agg, x) }
      Aggs::CourseUpdate.call(course.id, user.id)
      Aggs::CourseUpdate.call(course.id)
    end

  end
end