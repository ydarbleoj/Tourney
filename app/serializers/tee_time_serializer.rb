class TeeTimeSerializer
  include FastJsonapi::ObjectSerializer
  set_type :tee_time
  set_id :id

  belongs_to :user
  belongs_to :team, serializer: Scoreboard::TeamSerializer

  attributes :group, :user_id, :team_id

  attribute :round_number do |object|
    object.tournament_round.round_number
  end

  attribute :tee_time do |object|
    object.tee_time.strftime("%I:%M")
  end
end