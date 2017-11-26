class TournamentRoundsController < ApplicationController
  # before_action :authenticate_user!
  before_action :current_tournament
  # before_action :authorize_user

  def index
    p 'rounds'
    p rounds = @current_tournament.tournament_rounds
    # set_scorecards
    render json: rounds
  end

  def show

  end


  def new
    if @current_tournament.tournament_rounds.exists?
      @rnd = session[:round_count]
      @tournament_rounds = @current_tournament.tournament_rounds.new
    else
      session[:round_count] = 1
      @rnd = 1
      @tournament_rounds = @current_tournament.tournament_rounds.new
    end
  end

  def create
    @tournament_rounds = @current_tournament.tournament_rounds.create(tourn_rounds_params)

    if session[:round_count] == @rounds
      if @tournament_rounds.save
        new_course = NewCourse.find(@tournament_rounds.new_course_id)
        @current_tournament.tournament_new_courses.create(new_course_id: new_course.id)
        @current_tournament.leaderboards.create(user_id: current_user.id)

        flash[:succes] = "Success, time to invite players!"
        redirect_to tournament_path(@current_tournament)
      else
        redirect_to 'new'
      end
    else
      if @tournament_rounds.save
        new_course = NewCourse.find(@tournament_rounds.new_course_id)
        @current_tournament.tournament_new_courses.create(new_course_id: new_course.id)

        session[:round_count] += 1

        redirect_to new_tournament_tournament_round_path(@current_tournament.id)
      else
        redirect_to 'new'
      end
    end
  end

  def current_tournament
    @current_tournament = Tournament.find(params[:tournament_id])
    @rounds = @current_tournament.num_rounds
  end

  def authorize_user
    @role = TournamentUser.where(tournament_id: @current_tournament.id,
      user_id: current_user.id).first.role
  end

  def set_scorecards
    tr_ids = @current_tournament.tournament_rounds.pluck(:id)
    @scorecards = current_user.scorecards.where(tournament_round_id: tr_ids).order(round_num: :asc)

    if @scorecards.present?
      @scorecards
    else
      tr_ids.each do |tr|
        tournament_round = @current_tournament.tournament_rounds.where(id: tr).first
        tournament_round.scorecards.create(
          user_id: current_user.id, new_course_id: tournament_round.new_course_id,
          handicap: current_user.handicap, round_num: tournament_round.round_number,
          total_score: 0, total_putts: 0, total_3putts: 0, total_net: 0)
      end
      set_scorecards
    end
  end

  private
  def tourn_rounds_params
    params.require(:tournament_round).permit(:round_number, :round_date,
      :new_course_id, :tournament_id)
  end
end