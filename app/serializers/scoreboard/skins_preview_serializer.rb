module Scoreboard
  class SkinsPreviewSerializer
    include FastJsonapi::ObjectSerializer
    set_type :leaderboard
    set_id :id

    belongs_to :tournament
    belongs_to :user
    has_many :scorecards
    has_one :skins_money, serializer: SkinsMoneySerializer

    attributes :handicap, :tournament_id, :position, :user_id, :total_skins, :skins_money

    attribute :username do |object|
      "#{object.user.first_name} #{object.user.last_name}"
    end

  end
end