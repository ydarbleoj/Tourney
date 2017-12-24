class TeeTimesController < ApplicationController
  before_action :authenticate_user
  before_action :set_tournament

  def index
    tee_time = TeeTime.where(tournament_round_id: @current_round.id, group: @group)
      .group_by { |x| [x[:group], x[:tee_time].strftime('%H:%M')] }
      .map { |x| [x[0], x[1].map { |x| { user: x.user.username } }] }.flatten(1)

    render json: tee_time
  end

  def show

  end

  private
  def buid_pairings(array)

  end

  def set_tournament
    @group = find_group
    @current_round = TournamentRound.where(round_number: params[:round], tournament_id: params[:tournament_id]).first
  end

  def find_group
    TournamentRound.joins(:tee_times).where('tournament_rounds.tournament_id = ?
      AND tee_times.user_id = ? AND tournament_rounds.round_number = ?', params[:tournament_id], current_user.id, params[:round]).pluck('tee_times.group').first
  end

end