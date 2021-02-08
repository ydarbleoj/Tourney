module Scoreboard
  class TeamSerializer
    include FastJsonapi::ObjectSerializer
    set_type :team
    set_id :id

    belongs_to :new_course, serializer: NewCourseSerializer

    has_many :team_scores, serializer: Scoreboard::TeamScoreSerializer
    has_many :tee_times, serializer: TeeTimeSerializer
    has_many :users, through: :tee_times

    attributes :finished, :total_net, :group, :is_won, :group_time, :position, :team_scores

    attribute :total do |object|
      if object.total_net.zero?
        0.0
      else
        object.total_net - (object.new_course.par * 2)
      end
    end

    attribute :players do |object|
      object.tee_times.map do |x|
        {
          username: x.user.username,
        }
      end
    end
  end
end
