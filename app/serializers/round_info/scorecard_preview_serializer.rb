# frozen_string_literal: true

module RoundInfo
  class ScorecardPreviewSerializer
    include FastJsonapi::ObjectSerializer
    set_type :scorecard
    set_id :id

    has_one :new_course, serializer: NewCourseSerializer

    attributes :total_score, :total_putts, :total_3putts,
               :new_course_id, :user_id, :tournament_round_id,
               :total_net, :round_num, :handicap, :id

    attribute :course_name do |object|
      object.new_course.name
    end
  end
end
