module Tournaments
  class RoundsController < Tournaments::BaseController
    skip_before_action :authenticate_user!


    def create
      # res = CreateRounds.call(@tournament, params)
      # if res
      #   render json: { success: true, tournament: TournamentSerializer.new(@tournament).seriali}
      # else
      #   render json: { success: false, message: 'unable to create rounds'}
      # end
    end
  end
end