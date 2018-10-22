module Leaderboards
  class SetSkin

    def self.net(id)
      new(id).after_score
    end

    def initialize(id)
      @user_score = UserScore.find(id)
      @scorecard  = user_score.scorecard
      @round      = user_score.tournament_round
    end

    def net
      hole_scores('net')
      p scores
    end

    private
    attr_reader :user_score, :scorecard, :round
    attr_writer :lowest_score, :current_skin, :skins, :scores

    def hole_scores(type)
      scores = round.user_scores.current_skin(user_score.number, type)
    end
  end
end