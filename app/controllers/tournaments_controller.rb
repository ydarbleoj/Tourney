class TournamentsController < ApplicationController
  # cattr_accessor :current_tournament
  before_action :authenticate_user
  before_action :set_current_tournament

  def index
    # @current_tournament
  p  params
    tournaments = Tournament.where(name: 'Bandon').order(year: :desc)
      .select(:id, :name, :year)
      .map do |tourn|
        {
          id: tourn.id,
          name: tourn.name,
          year: tourn.year,
          rounds: tourn.tournament_rounds.map { |x| { round_id: x.id, round_date: x.round_date.strftime('%F'), course_id: x.new_course_id, round_number: x.round_number }}
        }
      end

    render json: tournaments
  end

  def show
    @tournament = Tournament.find(params[:id])

    @users = @tournament.users.pluck(:id)
    authorize_user
  end

  def new
    @tournament = Tournament.new
  end

  def create
    @tournament = Tournament.new(tourn_params)

    if @tournament.save
     p @tournament.tournament_users.create(user_id: current_user.id, role: 'admin')


      flash[:succes] = "New Tournament Created"
      redirect_to  new_tournament_tournament_round_path(@tournament.id)
    else
      render 'new'
    end
  end

  def edit
    @tournament = Tournament.find(params[:id])
  end

  def update
    @tournament = Tournament.find(params[:id])
    if @tournament.update(tourn_params)
      redirect_to @tournament
    else
      render "edit"
    end
  end

  def history
    @tournaments = Tournament.where("end_date < ? AND name = ?", Date.today, 'Bandon').uniq

  end

  def stroke_leaderboard
  p  @tournament = Tournament.find(params[:id])
    # user_tournaments
    current_tournament


    if @current_tournament.nil?.! && @tournament.id == @current_tournament
      tourn = @tournament
      stroke_purse
      rnd_id(tourn)
      LeaderboardLogic.new(tourn).execute
      @lb = tourn.leaderboards.where.not(rnd2_score: nil).order(total_score: :asc)
    else
      tourn = @tournament
      stroke_purse
      rnd_id(tourn)
      @lb = tourn.leaderboards.where.not(rnd3_score: nil).order(total_score: :asc)
    end
  end

  def putting_leaderboard
    @tournament = Tournament.find(params[:id])
    # user_tournaments
    current_tournament

    if @current_tournament.nil?.! && @tournament.id == @current_tournament.id
      tourn = @tournament
      PuttingLeaderboardCalculations.new(tourn).execute
      putts_purse(tourn)
      rnd_id(tourn)
      @putting_lb = tourn.leaderboards.where.not(rnd2_score: nil).order(total_putts: :asc)
    else
      tourn = @tournament
      putts_purse(tourn)
      rnd_id(tourn)
      @putting_lb = tourn.leaderboards.where.not(rnd3_putts: nil).order(total_putts: :asc)
    end
  end

  def rnd_id(tourn)
    @rnd1_id = current_user.rounds.where(round_num: 1).where(tournament_id: tourn.id)
    @rnd2_id = current_user.rounds.where(round_num: 2).where(tournament_id: tourn.id)
    @rnd3_id = current_user.rounds.where(round_num: 3).where(tournament_id: tourn.id)
  end

  def tee_times
    @tournament = Tournament.find(params[:id])
    @rounds = Round.where(tournament_id: @tournament.id)
  end

  def stroke_purse
    @purse = @tournament.num_players * 30
  end

  def putts_purse(t)
    @three_putts = t.leaderboards.sum(:total_3_putts)
    @three_putts = @three_putts.nil?.! ? @three_putts : 0
  end

  def ranking
    t = Tournament.where(id: params[:id]).first
    rounds = t.leaderboards.order(:total_score)
    grouped_rounds = rounds.group_by {|x| x.total_score }.map {|x| x }
  end

  def set_current_tournament
    @current_tournament = Tournament.where(name: 'Bandon').order(year: :desc).first
  end

  def authorize_user
   p @role = TournamentUser.where(tournament_id: @tournament.id,
      user_id: current_user.id).first.role
  end

  private
    def check_for_user
      redirect_to root_path if current_user.nil?
    end

    def tourn_params
      params.require(:tournament).permit(:name, :year, :num_players, :num_rounds, :start_date, :end_date)
    end
end
