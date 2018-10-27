module Leaderboards
  class Scoring

    def self.call(id)
      new(id).call
    end

    def initialize(id)
      @user_score = UserScore.includes({ tournament_round: [{ new_course: [:holes] }], scorecard: :user_scores }, :user).find(id)
      @scorecard  = user_score.scorecard
      @tournament_round = scorecard.tournament_round
    end

    def call
      # update_leaderboard
      # tournament_round
      user_score
    end

    private
    attr_reader :user_score, :scorecard, :tournament_round

    def update_leaderboard
      Leaderboards::Updates.call(scorecard, leaderboard)
    end

    def set_skins
      Leaderboards::SetSkins.call(user_score, 'net_skin')
    end

    def update_team_scorecard

    end
  end
end