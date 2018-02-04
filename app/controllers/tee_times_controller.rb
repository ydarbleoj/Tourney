class TeeTimesController < ApplicationController
  before_action :authenticate_user
  before_action :set_tournament

  def index
    t_times = @current_round.team_scorecards.includes(:tee_times).order(group: :asc)
      .map { |x| [{group: x.group, team_scorecard_id: x.id, tee_time: x.group_time, users: x.tee_times.includes(:user)
        .map { |x| { user_id: x.user.id, user: x.user.first_name + ' ' + x.user.last_name.first, tee_time_id: x.id } }}] }

    ids = user_ids(t_times)

    awaiting = set_awaiting(ids)

    render json: [{times: t_times, awaiting: awaiting }]
  end

  def create
    times_to_update
    res = group_create

    if res.length == @user_ids.length
      render json: 'Success'
    else
      render json: 'Failed'
    end
  end

  def update
    times_to_update
    res = group_update

    if res == @tee_time_ids.length
      render json: 'Success'
    else
      render json: 'Failed'
    end
  end

  private
  def set_tournament
    rnd_num = params[:params].blank? ? params['round'] : params[:params]['round']
    tourn_id = params['tournament_id']
    @tournament = Tournament.find(tourn_id)
    @current_round = TournamentRound.where(round_number: rnd_num, tournament_id: tourn_id).first
  end

  def set_awaiting(ids)
    @tournament.users.where.not(id: ids).map { |x| { tee_time_id: nil, user_id: x.id, user: x.first_name + ' ' + x.last_name.first } }
  end

  def user_ids(times)
    times.map { |x| p x[0][:users].map { |x| x[:user_id] } }.flatten(1)
  end

  def group_update
    TeeTime.bulk_update(@tee_time_ids, @card)
  rescue => e
    p e
  end

  def group_create
    TeeTime.bulk_create(@current_round, @user_ids, @card)
  rescue => e
    p e
  end

  def times_to_update
    @card = params[:params]['times']
    @tee_times = params[:params]['times']['users']
    @tee_time_ids = @tee_times.map { |x| x['tee_time_id'] }
    @user_ids = @tee_times.map { |x| x['user_id'] }
  end

end