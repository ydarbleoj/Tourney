module Scoreboard
  class PuttingSerializer
    include FastJsonapi::ObjectSerializer
    set_type :leaderboard
    set_id :id
    belongs_to :tournament
    belongs_to :user, serializer: UserSerializer
    has_many :scorecards, serializer: Scorecards::PuttingSerializer

    attributes :total_putts, :total_3_putts, :handicap, :tournament_id, :user_id

    attribute :username do |object|
      "#{object.user.first_name} #{object.user.last_name}"
    end

    attribute :position do |object|
      object.position == 99 ? 'DNF' : object.position
    end

    attribute :rnd1_putts do |object|
      sc = object.scorecards.select { |x| x if x.round_num == 1 }[0]
      return 0 if sc.blank?
      sc.total_putts
    end

    attribute :rnd2_putts do |object|
      sc = object.scorecards.select { |x| x if x.round_num == 2 }[0]
      return 0 if sc.blank?
      sc.total_putts
    end

    attribute :rnd3_putts do |object|
      sc = object.scorecards.select { |x| x if x.round_num == 3 }[0]
      return 0 if sc.blank?
      sc.total_putts
    end

    attribute :rnd1_putting_avg do |object|
      sc = object.scorecards.select { |x| x if x.round_num == 1 }[0]
      return 0 if sc.blank?
      (sc.total_putts.to_f / 18).round(2)
    end

    attribute :rnd2_putting_avg do |object|
      sc = object.scorecards.select { |x| x if x.round_num == 2 }[0]
      return 0 if sc.blank?
      (sc.total_putts.to_f / 18).round(2)
    end

    attribute :rnd3_putting_avg do |object|
      sc = object.scorecards.select { |x| x if x.round_num == 3 }[0]
      return 0 if sc.blank?
      (sc.total_putts.to_f / 18).round(2)
    end

    attribute :rnd1_3putting do |object|
      sc = object.scorecards.select { |x| x if x.round_num == 1 }[0]
      return 0 if sc.blank?
      (sc.total_3putts.to_f / 18).round(2)
    end

    attribute :rnd2_3putting do |object|
      sc = object.scorecards.select { |x| x if x.round_num == 2 }[0]
      return 0 if sc.blank?
      (sc.total_3putts.to_f / 18).round(2)
    end

    attribute :rnd3_3putting do |object|
      sc = object.scorecards.select { |x| x if x.round_num == 3 }[0]
      return 0 if sc.blank?
      (sc.total_3putts.to_f / 18).round(2)
    end

  end
end