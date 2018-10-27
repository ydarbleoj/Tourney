module Leaderboards
  class TeamScoring

    def self.call(user_score)
      new(id).call
    end

    def initialize(user_score)
      @number           = user_score.number
      @scorecard        = user_score.scorecard
      @tournament_round = user_score.tournament_round
    end

    def call

    end

    private
    attr_reader :number, :user_score, :tournament_round, :user_ids

    def tee_time_ids

    end
  end
end