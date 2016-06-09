class TournamentsController < ApplicationController
  cattr_accessor :current_tournament
  before_filter :check_for_user

  def index
      @tournaments = Tournament.all
      current_tournament
  end

  def show
    @tournament = current_user.tournaments.where("end_date < ?", Date.today).first
    stroke_leaderboard
    putting_leaderboard
    tee_times
  end

  def new
    @tournament = Tournament.new
    'Tourn New'
    @tournament.build_round
  end

  def create
   @tournament = Tournament.new(tourn_params)

   if @tournament.save
     flash[:succes] = "New Tournament Created"
     redirect_to @tournament
   else
     redirect_to tournaments_path
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

  def current_tournament
   p tourn = Tournament.where("end_date > ?", Date.today).first
   p "USer #{current_user.email}"
   p "Scorecard #{current_user.scorecards.first.id}"
   p "Round #{current_user.tournament_rounds.where(tournament_id: tourn.id)}"
   p  user_tourn = current_user.tournament_rounds.where(tournament_id: tourn.id).first
   p user_tourn = user_tourn.nil? ? nil : user_tourn.tournament

    @current_tournament ||= user_tourn
  end

  def history
    @tournaments = Tournament.where("end_date < ?", Date.today).uniq
  end

  def stroke_leaderboard
    @tournament = Tournament.find(params[:id])
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
    # user_tournaments
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

  private
    def check_for_user
      redirect_to root_path if current_user.nil?
    end

    def tourn_params
      params.require(:tournament).permit(:name, :year, :num_players, :num_rounds, rounds_attributes: [:id, :user_id, :course_id, :round_num, :s1, :s2, :s3, :s4, :s5, :s6,
      :s7, :s8, :s9, :s10, :s11, :s12, :s13, :s14, :s15, :s16, :s17, :s18, :p1, :p2, :p3,
      :p4, :p5, :p6, :p7, :p8, :p9, :p10, :p11, :p12, :p13, :p14, :p15, :p16, :p17, :p18])
    end
end
