module Scoreboard
  class Scoring

    def self.call(id)
      new(id).call
    end

    def initialize(id)
      @user_score = UserScore.includes(:tournament_round, :scorecard, :user, :hole).find(id)
      @scorecard  = user_score.scorecard
      @tournament_round = user_score.tournament_round
      @user       = user_score.user
      @hole       = user_score.hole
      @course_agg = UserCourseAgg.where(user_id: @user.id, new_course_id: @scorecard.new_course_id).first
    end

    def call
      ActiveRecord::Base.transaction do
        update_leaderboard
        set_skins
        update_team_scorecard
        update_aggs
      end
      true
    rescue StandardError => e
      p "error #{e}"
      false
    end

    private
    attr_reader :user_score, :scorecard, :tournament_round, :user, :course_agg, :hole

    def update_leaderboard
      Scoreboard::Updates.call(scorecard.leaderboard_id)
    end

    def set_skins
      Scoreboard::SetSkin.call(user_score, 'net_skin')
    end

    def update_team_scorecard
      Scoreboard::TeamScoring.call(user_score)
    end

    def update_aggs
      Aggs::HoleProcess.call(user.id, course_agg.id, hole)
    end
  end
end