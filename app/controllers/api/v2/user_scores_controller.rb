module API
  module V2
    class UserScoresController < ApplicationController
      before_action :authenticate_user
      before_action :set_scorecard

      def create
        create_score
        update_leaderboard
        @scorecard.reload

        payload = Admins::ScorecardsWithHolesSerializer.new(@scorecard).serialized_json
        render json: payload
      rescue StandardError => e
        p "error #{e}"
      end

      def update
        user_score = UserScore.find(params['user_score_id'])
        user_score.update!(user_scores_params)
        @scorecard.reload

        payload = Admins::ScorecardsWithHolesSerializer.new(@scorecard).serialized_json
        render json: payload
      rescue StandardError => e
        p "error #{e}"
      end

      private
      def user_scores_params
        params.require(:user_score).permit(:user_score, :scorecard_id, :par, :handicap, :score, :putts, :number, :net, :hole_id)
      end

      def set_scorecard
        p params
        @scorecard = Scorecard.includes({ new_course: [:holes] }, :user_scores, :tournament_round).find(params['scorecard_id'])
      end

      def create_score
        @user_score = @scorecard.user_scores.create!(user_scores_params)
      end

      def update_leaderboard
        Scoreboard::Scoring.call(@user_score.id)
      end
    end
  end
end
