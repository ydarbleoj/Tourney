module Leaderboards
  class Scoring

    def self.call(id)
      new(id).call
    end

    def initialize(id)
      @user_score = UserScore.includes(:tournament_round, :scorecard, :user).find(id)
      @scorecard  = user_score.scorecard
      @tournament_round = user_score.tournament_round
    end

    def call
      ActiveRecord::Base.transaction do
        update_leaderboard
        set_skins
        update_team_scorecard
      end
    rescue StandardError => e
      p "error #{e}"
    end

    private
    attr_reader :user_score, :scorecard, :tournament_round

    def update_leaderboard
      Leaderboards::Updates.call(scorecard.leaderboard_id)
    end

    def set_skins
      Leaderboards::SetSkin.call(user_score, 'net_skin')
    end

    def update_team_scorecard
      Leaderboards::TeamScoring.call(user_score)
    end
  end
end