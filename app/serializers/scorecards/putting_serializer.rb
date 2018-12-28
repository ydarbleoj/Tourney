module Scorecards
  class PuttingSerializer
    include FastJsonapi::ObjectSerializer
    set_type :scorecard
    set_id :id

    belongs_to :user
    belongs_to :new_course
    belongs_to :leaderboard

    attributes :id, :handicap, :total_3putts, :total_putts, :user_id, :round_num

    attribute :putting_avg do |object|
      (object.total_putts.to_f / 18).round(2)
    end

    attribute :three_putt_avg do |object|
      (object.total_3putts.to_f / 18).round(2)
    end
  end
end