module Admins
  class TeeTimesSerializer
    include FastJsonapi::ObjectSerializer
    set_type :team
    set_id :id

    belongs_to :new_course
    has_many :tee_times
    has_many :users, through: :tee_times

    attributes :group_time, :tournament_round_id, :new_course_id, :id

    attribute :course_name do |object|
      object.new_course.name
    end

    attribute :group do |object|
      object.group.split('group')[1]
    end

    attribute :players do |object|
      object.tee_times.map do |tee_time|
        {
          first_name: tee_time.user.first_name,
          last_name: tee_time.user.last_name,
          tee_time_id: tee_time.id,
          user_id: tee_time.user.id,
        }
      end
    end
  end
end