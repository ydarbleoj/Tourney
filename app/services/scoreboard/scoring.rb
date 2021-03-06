# frozen_string_literal: true

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
        update_team
        update_aggs
      end
      true
    rescue StandardError => e
      p "error  Scoreboard::Scoring #{e}"
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

    def update_team
      Tourney::Services::TeamScoring.new(user_score).execute
    end

    def update_aggs
      Aggs::HoleProcess.call(user.id, course_agg.id, hole)
    end
  end
end
