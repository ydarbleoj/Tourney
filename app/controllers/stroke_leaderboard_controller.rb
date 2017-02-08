class StrokeLeaderboardController  < ApplicationController
  before_action :authenticate_user!
  # before_action :current_tournament

  def index
    @tournament = Tournament.find(params[:tournament_id])

    @lb = @tournament.leaderboards.order(net_total: :asc)
  end


  def current_tournamnet
    p params
    @rounds = @tournament.num_rounds
  end
  private

end
