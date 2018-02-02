class TeeTimesController < ApplicationController
  before_action :authenticate_user
  before_action :set_tournament

  def index
   p t_times = @current_round.tee_times.includes(:user).order(tee_time: :asc)
      .group_by { |x| [x[:group], x[:tee_time].strftime('%H:%M')] }
      .map { |x| x[1].map { |x| { tee_time_id: x.id, group: x.group, user_id: x.user.id, user: x.user.first_name + ' ' + x.user.last_name.first } } } #.flatten(1)

    render json: t_times
  end

  def update
    p 'EDIT'
    p params

  end

  private
  def set_tournament
    @current_round = TournamentRound.where(round_number: params[:round], tournament_id: params[:tournament_id]).first
  end

end