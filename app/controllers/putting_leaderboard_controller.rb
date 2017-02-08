class PuttingLeaderboardController  < ApplicationController
  before_action :authenticate_user!

  def index
    @tournament = Tournament.find(params[:tournament_id])
    @putting_lb = @tournament.leaderboards.order(total_putts: :asc)
    @three_putts = @tournament.leaderboards.sum(:total_3_putts)
  end


end