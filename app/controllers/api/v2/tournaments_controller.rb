module API
  module V2
    class TournamentsController < ApplicationController

      def index
        payload = Tournament.where(name: 'Bandon')
        render json: TournamentSerializer.new(payload).serialized_json
      end
    end
  end
end