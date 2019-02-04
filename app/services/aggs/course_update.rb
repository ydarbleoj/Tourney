#
# This Agg updates UserCourseAgg and CourseAgg
# after the completion of a players round
# user_id = nil -- CourseAgg
# user_id = 22 -- UserCourseAgg
#
module Aggs
  class CourseUpdate

    def self.call(course_id, user_id = nil)
      new(course_id, user_id).call
    end

    def initialize(course_id, user_id)
      @course_id = course_id
      @user_id   = user_id
      @course    = user_id.blank? ? course_agg : user_course
    end

    def call
      avgs      = card_avgs(course_id)
      hole_avgs = hole_avgs(course)
      lr        = lowest_round
      diff      = hole_diff(course)
      diff      = diff.merge(lr)
      stats     = avgs.merge(hole_avgs.merge(diff))

      ActiveRecord::Base.transaction do
        course.update(stats.compact)
        Aggs::UserUpdate.call(user_id) if user_id.present?
      end
    rescue StandardError => e
      p "error #{e.message} - #{course_id} : #{user_id}"
      false
    end

    private
    attr_reader :course_id, :user_id, :course

    def card_avgs(course_id)
      h = {}
      res = user_id.blank? ? scorecards : user_scorecards
      res[0].attributes.except('id')
    end

    def hole_avgs(course)
      h = {}
      res = course.hole_par_avgs
      h['par3_avg'] = '%.2f' % res[3] ||= 0
      h['par4_avg'] = '%.2f' % res[4] ||= 0
      h['par5_avg'] = '%.2f' % res[5] ||= 0
      h
    end

    def lowest_round
      h = course.lowest_round
      h.blank? ? {} : { lowest_round_id: h.id }
    end

    def hole_diff(course)
      res = course.hole_difficulty
      return {} if res[0]['hole_diff'].blank?
      h = {}
      h['easiest_hole_id'] = res[-1]['agg_id']
      h['hardest_hole_id'] = res[0]['agg_id']
      h
    end

    def course_agg
      CourseAgg.where(new_course_id: course_id).first_or_create
    end

    def user_course
      UserCourseAgg.where(new_course_id: course_id, user_id: user_id).first_or_create
    end

    def user_scorecards
      Scorecard.user_course_averages(user_id, course_id)
    end

    def scorecards
      Scorecard.course_averages(course_id)
    end

  end
end