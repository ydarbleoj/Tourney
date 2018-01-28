class Info::OverallStats::PreviewsController  < ApplicationController
  before_action :authenticate_user
  before_action :set_tournament

  def index
    payload = []
    payload = TournamentOverallStats.new(@tournament, 'preview').execute
    render json: payload
  end

  private

   def set_tournament
    @tournament = Tournament.find(params[:tournament_id])
    @round_ids  = @tournament.tournament_rounds.pluck(:id)
  end
end
