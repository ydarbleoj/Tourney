#
# This updates UserHoleAggs and HoleAggs
#
module Aggs
  class HoleProcess

    def self.call(user_id, course_agg_id, hole)
      new(user_id, course_agg_id, hole).call
    end

    def initialize(user_id, course_agg_id, hole)
      @user_id         = user_id
      @course_agg_id   = course_agg_id
      @course_id       = hole.new_course_id
      @hole_id         = hole.id
      @hole            = hole
      @scorecards      = set_scorecards
      @user_hole_agg   = user_agg
    end

    def call
      return false if scorecards.blank?
      ActiveRecord::Base.transaction do
        @user_hole_agg.update(scorecards)
        calc_hole_aggs
      end
    rescue StandardError => e
      p " error #{e.message}"
    end

    private
    attr_accessor :user_id, :course_agg_id, :course_id,  :hole_id, :hole, :scorecards, :hole_agg

    def calc_hole_aggs
      hole_agg = HoleAgg.find_by(hole_id: hole_id)
      scores = hole_agg.user_hole_avgs
      return false unless scores
      scores = scores[0].attributes.except('id')
      hole_agg.update(scores)
    end

    def user_agg
      UserHoleAgg.where(user_id: user_id, hole_id: hole_id, user_course_agg_id: course_agg_id, par: hole.par).first_or_create
    end

    def set_scorecards
      card = Scorecard.hole_averages(user_id, course_id, hole_id)[0].attributes.except('id')
      card['count'] == 0 ? false : card
    end
  end
end