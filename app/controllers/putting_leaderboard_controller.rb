class PuttingLeaderboardController  < ApplicationController
  before_action :authenticate_user
  before_action :set_tournament

  def index
    payload = @tournament.leaderboards.putting
    payload = Leaderboards::SetPositions.new.by_scores(payload, 'total_putts')
    render json: payload
  end

  private
  def set_tournament
    @tournament = Tournament.find(params[:tournament_id])
  end


end