module API
  module V2
    class TournamentsController < ApplicationController
      before_action :authenticate_user

      def index
        payload = Tournament.current_and_list('Bandon')
        render json: TournamentSerializer.new(payload).serialized_json
      end
    end
  end
end