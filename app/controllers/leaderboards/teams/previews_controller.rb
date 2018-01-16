class Leaderboards::Teams::PreviewsController  < ApplicationController
  before_action :authenticate_user
  before_action :set_tournament

  def index
    payload = @tournament.team_scorecards.joins(:tee_times)
      .where('tee_times.user_id =?', current_user.id)
      .includes(:tournament_round, :users)
      .group_by { |x| [x.tournament_round.round_number] }
      .map do |x|
        {
          round_number: x[0][0],
          total_net: x[1][0].total_net,
          group: x[1][0].group.split(' ').last,
          players: x[1].map { |x| x.users.map(&:username) }[0]
        }
      end

    render json: payload
  end


  private
  def set_tournament
    @tournament = Tournament.find(params[:tournament_id])
  end

end
