module Scoreboard
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
        # set_skins
        # update_team_scorecard
      end
      true
    rescue StandardError => e
      p "error #{e}"
      false
    end

    private
    attr_reader :user_score, :scorecard, :tournament_round

    def update_leaderboard
      Scoreboard::Updates.call(scorecard.leaderboard_id)
    end

    def set_skins
      Scoreboard::SetSkin.call(user_score, 'net_skin')
    end

    def update_team_scorecard
      Scoreboard::TeamScoring.call(user_score)
    end
  end
end