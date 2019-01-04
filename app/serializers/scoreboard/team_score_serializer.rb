module Scoreboard
  class TeamScoreSerializer
    include FastJsonapi::ObjectSerializer
    set_type :team_score
    set_id :id

    belongs_to :team_scorecard
    attributes :net, :number, :par
  end
end