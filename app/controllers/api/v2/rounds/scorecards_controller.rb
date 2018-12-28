module API
  module V2
    module Rounds
      class ScorecardsController < TournamentBaseController
        skip_before_action :authenticate_user

        def index
          if @tournament_user
            scorecard = Scorecard.for_user_round(current_user.id, params['tournament_round_id'])
            payload = RoundInfo::UserScorecardSerializer.new(scorecard).serialized_json
          else
            payload = {}
          end
          render json: payload
        end

      end
    end
  end
end