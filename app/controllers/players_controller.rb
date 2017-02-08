class PlayersController < ApplicationController
  before_action :authenticate_user!
  before_action :current_tournament

  def index
   p "PLAYER"
   p @current_tournament.year
   p @users = @current_tournament.users
  end

  def current_tournament
   @current_tournament = Tournament.find(params[:tournament_id])
  end


end