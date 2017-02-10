class RoundTeeTimesController < ApplicationController
  before_action :authenticate_user!
  before_action :current_tournament
  before_action :authorize_user, only: [:new, :create, :edit]

  def index
    @tournament  = @current_tournament
    @round_one   = @tournament.tournament_rounds.where(round_number: 1).first
    @round_two   = @tournament.tournament_rounds.where(round_number: 2).first
    @round_three = @tournament.tournament_rounds.where(round_number: 3).first


    @round_one = @round_one.round_tee_times
    @round_two = @round_two.round_tee_times
    @round_three = @round_three.round_tee_times
  end

  def show

  end

  def new
    if @current_tournament.round_tee_times.exists?
      @rnd = session[:round_count]

      @round_tee_times = []
      @tournament_round = @current_tournament.tournament_rounds.where(round_number: @rnd).first

      @groups.times do
        @round_tee_times << @tournament_round.round_tee_times.new
      end
    else
      session[:round_count] = 1
      @rnd = 1

      @round_tee_times = []
      @tournament_round = @current_tournament.tournament_rounds.where(round_number: @rnd).first

      i = 0
      @groups.times do
        i += 1
        @round_tee_times << @tournament_round.round_tee_times.new(group: i)
      end

    end
  end

  def create
    if params.has_key?("tee_times")
      if session[:round_count] == @rounds
         @tournament_round = @current_tournament.tournament_rounds.where(round_number: @rnd).first
        params['tee_times'].each do |tt|
          @tournament_round.round_tee_times.create(tee_time_params(tt))
        end

        flash[:success] = "Success, tee times made!"
        redirect_to tournament_round_tee_times_path(@current_tournament.id)
      else
        @tournament_round = @current_tournament.tournament_rounds.where(round_number: session[:round_count]).first
        params['tee_times'].each do |tt|
          @tournament_round.round_tee_times.create(tee_time_params(tt))
        end

        session[:round_count] += 1
        redirect_to  new_tournament_round_tee_time_path(@current_tournament.id)
      end
    else
      render 'new'
    end
  end

  private
  def current_tournament
    @current_tournament = Tournament.find(params[:tournament_id])
    @rounds = @current_tournament.num_rounds
    p @groups = @current_tournament.num_players / 4
  end

  def authorize_user
   p @role = TournamentUser.where(tournament_id: @current_tournament.id,
      user_id: current_user.id).first.role
  end

  def tee_time_params(tt_params)
    tt_params.permit(:tournament_round_id, :group, :player_one,
      :player_two, :player_three, :player_four, :tee_time)
  end
end