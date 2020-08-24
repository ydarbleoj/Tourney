module Scoreboard
  class TeamPreviewSerializer
    include FastJsonapi::ObjectSerializer
    set_type :team
    set_id :id

    belongs_to :new_course, serializer: NewCourseSerializer

    attributes :finished, :total_net, :group, :is_won, :group_time, :position

    attribute :total do |object|
      object.total_net - (object.new_course.par * 2)
    end
  end
end