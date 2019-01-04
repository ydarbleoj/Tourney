class TeeTimeSerializer
  include FastJsonapi::ObjectSerializer
  set_type :tee_time
  set_id :id

  belongs_to :user
  belongs_to :team_scorecard, serializer: Scoreboard::TeamSerializer

  attributes :tee_time, :group, :user_id
end