# frozen_string_literal: true

module API
  module V2
    module Rounds
      class TeamScorecardsController < TournamentBaseController
        skip_before_action :authenticate_user

        def show
          payload = RoundInfo::TeamCardSerializer.new(team_scorecard).serialized_json
          render json: payload
        end

        private

        def team_scorecard
          @tournament.teams.includes(team_scorecard_includes)
                           .find_by(id: params[:id])

        end

        def team_scorecard_includes
          [
            :new_course => [:holes],
            :scorecards => [:user_scores],
            :team_scores => [:score_1, :score_2]
          ]
        end
      end
    end
  end
end
