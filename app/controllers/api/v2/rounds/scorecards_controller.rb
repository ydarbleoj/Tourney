# frozen_string_literal: true

module API
  module V2
    module Rounds
      class ScorecardsController < TournamentBaseController
        skip_before_action :authenticate_user
        before_action :find_scorecard, :only => [:index]

        def index
          if @tournament_user
            if params[:team_id].present?
              payload = RoundInfo::TeamCardSerializer.new(team_scorecard).serialized_json
            else
              player_card = RoundInfo::UserScorecardSerializer.new(@scorecard).serialized_json
              team_cards = RoundInfo::UserScorecardSerializer.new(
                players_team_scorecards
              ).serialized_json

              payload = {
                player_card: player_card,
                team_cards: team_cards
              }
            end
          else
            payload = {}
          end
          render json: payload
        end

        def update
          @scorecard = Scorecard.includes(:user_scores).find(params['id'])
          completed = @scorecard.user_scores.size == 18

          if scorecard_params['finished'] == true && completed
            @scorecard.update!(finished: true, dnf: false)
            @scorecard.leaderboard.update(dnf: false)
            run_aggs
          else
            @scorecard.update(finished: true, dnf: true)
            @scorecard.leaderboard.update(dnf: true)
          end

          if @scorecard.save
            render json: { success: true }
          else
            render json: { success: false }
          end
        end

        private

        def scorecard_params
          params.require(:scorecard).permit(:total_score, :total_putts, :total_3putts,
            :new_course_id, :user_id, :tournament_round_id, :total_net, :handicap, :finished, :dnf,
            user_scores_attributes: [:id, :number, :score, :putts, :skin, :net, :handicap, :net_skin])
        end

        def run_aggs
          Aggs::CourseUpdate.call(@scorecard.new_course_id, current_user.id)
          Aggs::RoundSetup.call(@scorecard.tournament_round_id)
        end

        def find_scorecard
          @scorecard = Scorecard.for_user_round(current_user.id, params['tournament_round_id'])
        end

        def players_team_scorecards
          @scorecard.team.scorecards
                    .includes({ new_course: :holes }, :user_scores, :team_card)
                    .where.not(id: @scorecard.id)
        end

        def team_scorecard
          @tournament.teams.includes(team_scorecard_includes)
                           .find_by(id: params[:team_id])

        end

        def team_scorecard_includes
          [
            :new_course => [:holes],
            :scorecards => [:user_scores]
          ]
        end
      end
    end
  end
end
