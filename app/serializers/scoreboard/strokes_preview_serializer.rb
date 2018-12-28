module Scoreboard
  class StrokesPreviewSerializer
    include FastJsonapi::ObjectSerializer
    set_type :leaderboard
    set_id :id

    belongs_to :tournament
    belongs_to :user
    has_many :scorecards

    attributes :total_score, :net_total, :handicap, :tournament_id, :position, :user_id

    attribute :username do |object|
      "#{object.user.first_name} #{object.user.last_name}"
    end
  end
end