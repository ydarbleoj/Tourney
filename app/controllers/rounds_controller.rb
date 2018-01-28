class RoundsController < ApplicationController
  before_action :current_tourn
  before_action :check_for_user

  def index
    @tourn_rounds = Round.where(tournament_id: params["tournament_id"]).where(user_id: current_user.id).order(round_num: :asc)
    current_tourn
  end


  def new
    @round = Round.new
    @courses = Course.all.map {|x| [x.name, x.id] }
  end

  def create
  	@round = current_user.rounds.build(round_params)

    if @round.save
      flash[:success] = "Round Saved"
      redirect_to users_path
    else
      redirect_to users_path
    end
  end

  def edit
    tournament = Tournament.find(params[:tournament_id])
    @round = tournament.rounds.find(params[:id])
    shots_calculation
    putts_calculation
    score
    total_putts
    handicap
  end

  def show
    @round = current_user.rounds.find(params[:id])
    shots_calculation
    putts_calculation
  end

  def update
    tournament = Tournament.find(params[:tournament_id])
    @round = tournament.rounds.find(params[:id])
    shots_calculation
    putts_calculation
    score
    total_putts
    respond_to do |format|
      if @round.update_attributes(round_params)
        shots_calculation
        putts_calculation
        score
        total_putts
        p "Round Submitted"
        format.html { redirect_to edit_tournament_round_path(@round.tournament.id, @round.id) }
      else
        render 'home'
      end
    end
  end

  def current_tourn
    @current_tourn = Tournament.where("end_date > ?", Date.today).first
  end

  def score
    @round.s18.nil?.! ? @score = @total_shots : nil
  end

  def total_putts
    @round.p18.nil?.! ? @putts = @total_putts : nil
  end

  def shots_calculation
    shots, @f9_shots, @b9_shots= [], [], []
    holes = 1..18

    holes.each do |i|
      shots << @round["s#{i}"]
    end
    f9 = shots[0,9].compact.inject(0) {|sum, x| sum + x }
    b9 = shots[9,18].compact.inject(0) {|sum, x| sum + x }
    @f9_shots = f9.nil?.! ? f9 : 0
    @b9_shots = b9.nil?.! ? b9 : 0
    @total_shots = @f9_shots + @b9_shots
  end

  def putts_calculation
    putts, @f9_putts, @b9_putts = [], [], []
    holes = 1..18

    holes.each do |i|
      putts << @round["p#{i}"]
    end
    f9 = putts[0,9].compact.inject(0) {|sum, x| sum + x }
    b9 = putts[9,18].compact.inject(0) {|sum, x| sum + x }
    @f9_putts = f9.nil?.! ? f9 : 0
    @b9_putts = b9.nil?.! ? b9 : 0
    @total_putts = @f9_putts + @b9_putts
  end

  def handicap
    @round.user.handicap.nil?.! ? @handicap = ((@round.user.handicap * 0.9) * 1).round : @handicap = 0
  end

  def round_params
  	params.require(:round).permit(:user_id, :score, :handicap, :putts, :course_id, :date_played,
      :tournament_id, :tee_time, :date_played, :round_num, :s1, :s2, :s3, :s4, :s5, :s6,
      :s7, :s8, :s9, :s10, :s11, :s12, :s13, :s14, :s15, :s16, :s17, :s18, :p1, :p2, :p3,
      :p4, :p5, :p6, :p7, :p8, :p9, :p10, :p11, :p12, :p13, :p14, :p15, :p16, :p17, :p18)
  end


end
