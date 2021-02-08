module API
  module V2
    module Tournaments
      class RoundsController < TournamentBaseController
        skip_before_action :authenticate_user

        def create
         res = CreateRounds.call(@tournament, params['round'], current_user)
          if res
            render json: { success: true, tournament: TournamentSerializer.new(@tournament).serialized_json }
          else
            render json: { success: false, message: 'unable to create rounds'}
          end
        end
      end
    end
  end
end
