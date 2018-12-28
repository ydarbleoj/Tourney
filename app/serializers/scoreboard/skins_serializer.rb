module Scoreboard
  class SkinsSerializer
    include FastJsonapi::ObjectSerializer
    attributes :handicap, :tournament_id, :position, :user_id, :total_skins, :skins_money
    set_type :leaderboard
    set_id :id

    belongs_to :tournament
    belongs_to :user, serializer: UserSerializer
    has_many :scorecards, serializer: Scoreboard::ScorecardSerializer
    has_one :skins_money, serializer: SkinsMoneySerializer


    attribute :username do |object|
      "#{object.user.first_name} #{object.user.last_name}"
    end

    attribute :rnd1_net do |object|
      object.scorecards.select { |x| x.round_num == 1 }.map { |xx| xx.net_skin_total }[0]
    end

    attribute :rnd2_net do |object|
      object.scorecards.select { |x| x.round_num == 2 }.map { |xx| xx.net_skin_total }[0]
    end

    attribute :rnd3_net do |object|
      object.scorecards.select { |x| x.round_num == 3 }.map { |xx| xx.net_skin_total }[0]
    end

    attribute :cards do |object|
      object.scorecards.map do |card|
        {
          "round_#{card.round_num}":
            {
              total: card.net_skin_total,
              holes_won: card.user_scores.map {|x| x.number if x.net_skin }.compact
            }
        }
      end
    end

  end
end