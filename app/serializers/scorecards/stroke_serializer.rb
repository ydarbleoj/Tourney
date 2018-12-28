module Scorecards
  class StrokeSerializer
    include FastJsonapi::ObjectSerializer
    set_type :scorecard
    set_id :id

    belongs_to :user
    belongs_to :new_course
    belongs_to :leaderboard

    has_many :user_scores

    attributes :id, :handicap, :total_net, :user_id, :round_num

  end
end