module Scoreboard
  class UserSkinsSerializer
    include FastJsonapi::ObjectSerializer
    set_type :user_score
    set_id :id

    belongs_to :scorecard

    attributes :id, :score, :par, :putts, :number
  end
end