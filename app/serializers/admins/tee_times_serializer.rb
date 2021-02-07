module Admins
  class TeeTimesSerializer
    include FastJsonapi::ObjectSerializer
    set_type :team
    set_id :id

    belongs_to :new_course
    has_many :scorecards
    has_many :users, through: :tee_times

    attributes :group_time, :tournament_round_id, :new_course_id, :id

    attribute :course_name do |object|
      object.new_course.name
    end

    attribute :group do |object|
      object.group
    end

    attribute :players do |object|
      object.scorecards.map do |scorecard|
        {
          first_name:   scorecard.user.first_name,
          last_name:    scorecard.user.last_name,
          scorecard_id: scorecard.id,
          user_id:      scorecard.user.id,
          handicap:     scorecard.handicap
        }
      end
    end
  end
end
