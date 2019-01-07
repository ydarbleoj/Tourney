module Admins
  class TeeTimesSerializer
    include FastJsonapi::ObjectSerializer
    set_type :team_scorecard
    set_id :id

    has_many :tee_times
    has_many :users, through: :tee_times

    attributes :group, :group_time

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