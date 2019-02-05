module Scoreboard
  class PuttingPreviewSerializer
    include FastJsonapi::ObjectSerializer
    set_type :leaderboard
    set_id :id

    belongs_to :tournament
    belongs_to :user
    has_many :scorecards

    attributes :total_putts, :total_3_putts, :handicap, :tournament_id, :user_id

    attribute :username do |object|
      "#{object.user.first_name} #{object.user.last_name}"
    end

    attribute :position do |object|
      object.position == 99 ? 'DNF' : object.position
    end
  end
end