module API
  module V2
    module Rounds
      class ListsController < TournamentBaseController
        skip_before_action :authenticate_user

        def index
          payload = @tournament.tournament_rounds.rounds

          render json: RoundInfo::ListSerializer.new(payload).serialized_json
        end

      end
    end
  end
end