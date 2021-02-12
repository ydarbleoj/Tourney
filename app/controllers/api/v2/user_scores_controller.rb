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
        @user_score = UserScore.find(params['user_score_id'])
        @user_score.update!(user_scores_params)
        update_leaderboard
        @scorecard.reload
        p "here99"
        p @scorecard.id
        p current_user
        if @user_score.user_id != current_user.id
          p 'hitto'
          p @scorecard = find_current_player_scorecard
        end
        p 'hhs'
        p @scorecard.id
        player_card = RoundInfo::UserScorecardSerializer.new(@scorecard).serialized_json

        team_cards = RoundInfo::UserScorecardSerializer.new(
          players_team_scorecards
        ).serialized_json

        payload = {
          player_card: player_card,
          team_cards: team_cards
        }

        render json: payload
      rescue StandardError => e
        p "error #{e}"
      end

      private
      def user_scores_params
        params.require(:user_score).permit(:user_score, :finished, :scorecard_id, :par, :handicap, :score, :putts, :number, :net, :hole_id)
      end

      def set_scorecard
        @scorecard = Scorecard.includes({ new_course: [:holes] }, :user_scores, :tournament_round, :team_card).find(params['scorecard_id'])
      end

      def create_score
        @user_score = @scorecard.user_scores.create(user_scores_params)
      end

      def update_leaderboard
        Scoreboard::Scoring.call(@user_score.id)
      end

      def players_team_scorecards
        p 'payer'
        p @scorecard
        @scorecard.team.scorecards
                  .order('team_cards.position')
                  .includes({ new_course: :holes }, :user_scores, :team_card)
                  .where.not(id: @scorecard.id)
      end

      def find_current_player_scorecard
        @scorecard.team.scorecards
                  .includes({ new_course: :holes }, :user_scores, :team_card)
                  .where.not(user_id: current_user.id).first
      end
    end
  end
end
