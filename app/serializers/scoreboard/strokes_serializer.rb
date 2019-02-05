module Scoreboard
  class StrokesSerializer
    include FastJsonapi::ObjectSerializer
    set_type :leaderboard
    set_id :id
    attributes :total_score, :total_putts, :total_3_putts, :net_total, :handicap, :tournament_id, :user_id,
      :rnd1_gnr, :rnd2_gnr, :rnd3_gnr

    belongs_to :tournament
    belongs_to :user, serializer: UserSerializer
    has_many :scorecards, serializer: Scorecards::StrokeSerializer

    attribute :username do |object|
      "#{object.user.first_name} #{object.user.last_name}"
    end

    attribute :rnd1_score do |object|
      object.scorecards.select { |x| x if x.round_num == 1 }.map { |xx| xx.total_net }[0]  if object.scorecards.first.present?
    end

    attribute :rnd2_score do |object|
      object.scorecards.select { |x| x if x.round_num == 2 }.map { |xx| xx.total_net }[0] if object.scorecards.second.present?
    end

    attribute :rnd3_score do |object|
      object.scorecards.select { |x| x if x.round_num == 3 }.map { |xx| xx.total_net }[0] if object.scorecards.third.present?
    end

    attribute :position do |object|
      object.position == 99 ? 'DNF' : object.position
    end

  end
end