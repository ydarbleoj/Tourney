module RoundInfo
  class CourseStatsSerializer
    include FastJsonapi::ObjectSerializer
    set_type :tournament_round
    set_id :id

    has_many :course_aggs, serializer: CourseAggSerializer
    has_many :round_aggs, serializer: RoundAggSerializer

  end
end

