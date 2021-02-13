# frozen_string_literal: true

module API
  module V2
    module Rounds
      class TeamScorecardsController < TournamentBaseController
        skip_before_action :authenticate_user
        before_action :find_team_scorecard, only: [:show]

        def show
          team = RoundInfo::TeamCardSerializer.new(@team).serialized_json

          player_card = RoundInfo::UserScorecardSerializer.new(
            players_team_scorecards[0]
          ).serialized_json

          team_cards = RoundInfo::UserScorecardSerializer.new(
            players_team_scorecards[1..3]
          ).serialized_json

          payload = {
            player_card: player_card,
            team_cards: team_cards,
            team: team
          }

          render json: payload
        end

        private

        def find_team_scorecard
          @team = @tournament.teams.includes(team_scorecard_includes).find_by(id: params[:id])
        end

        def team_scorecard_includes
          [
            :new_course => [:holes],
            :scorecards => [:user_scores, :team_card],
            :team_scores => [:score_1, :score_2]
          ]
        end

        def players_team_scorecards
          @team_cards ||= @team.scorecards.order('team_cards.position')
                               .includes({ new_course: :holes }, :user_scores, :team_card)
        end
      end
    end
  end
end
