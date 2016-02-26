class TournamentsController < ApplicationController
  cattr_accessor :current_tournament

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
    'Tourn Edit'
  end

  def update
    @tournament = Tournament.find(params[:id])
    'Tourn Update'
    if @tournament.update(tourn_params)
      redirect_to @tournament
    else
      render "edit"
    end
  end

  def current_tournament
    @current_tournament = current_user.tournaments.where("end_date > ?", Date.today).first

  end

  def history
    @tournaments = current_user.tournaments.where("end_date < ?", Date.today).uniq
  end


  def stroke_leaderboard
    @tournament = Tournament.find(params[:id])

    current_tournament

    if @tournament.id == @current_tournament.id
      tourn = @tournament
      stroke_purse
      LeaderboardLogic.new(tourn).execute
      @lb = tourn.leaderboards.order(total_score: :asc)
    else
      tourn = @tournament
      stroke_purse
      @lb = tourn.leaderboards.where.not(rnd3_score: nil).order(total_score: :asc)
    end
  end

  def putting_leaderboard
    @tournament = Tournament.find(params[:id])
    current_tournament

    if @tournament.id == @current_tournament.id
      tourn = @tournament
      PuttingLeaderboardCalculations.new(tourn).execute
      putts_purse(tourn)
      @putting_lb = tourn.leaderboards.order(total_putts: :asc)
    else
      tourn = @tournament
      putts_purse(tourn)
      @putting_lb = tourn.leaderboards.where.not(rnd3_putts: nil).order(total_putts: :asc)
    end
  end

  def tee_times
    @tournament = Tournament.find(params[:id])
    @rnd1 = Round.where(tournament_id: @tournament.id).where(round_num: 1)
    @rnd1_times = @rnd1.group_by { |x| x['tee_time'].strftime("%H:%M") }.map {|x| x }
    @rnd2 = Round.where(tournament_id: @tournament.id).where(round_num: 2)
    @rnd2_times = @rnd2.group_by { |x| x['tee_time'].strftime("%H:%M") }.map {|x| x }
    @rnd3 = Round.where(tournament_id: @tournament.id).where(round_num: 3)
    @rnd3_times = @rnd3.group_by { |x| x['tee_time'].strftime("%H:%M") }.map {|x| x }
  end

  def stroke_purse
    @purse = @tournament.num_players * 30
  end

  def putts_purse(t)
    @three_putts = t.leaderboards.sum(:total_3_putts)
    @three_putts = @three_putts.nil?.! ? @three_putts : 0
  end
  private
    def tourn_params
      params.require(:tournament).permit(:name, :year, :num_players, :num_rounds, rounds_attributes: [:id, :user_id, :course_id, :round_num, :s1, :s2, :s3, :s4, :s5, :s6,
      :s7, :s8, :s9, :s10, :s11, :s12, :s13, :s14, :s15, :s16, :s17, :s18, :p1, :p2, :p3,
      :p4, :p5, :p6, :p7, :p8, :p9, :p10, :p11, :p12, :p13, :p14, :p15, :p16, :p17, :p18])
    end
end
