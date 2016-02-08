class RoundsController < ApplicationController
  def index
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
  end

  def show
    rounds = Round.where.not(score: nil).order(score: :asc)
  end

  def round_params
  	params.require(:round).permit(
      :user_id, :score, :putts, :course_id, :date_played
      :tournament_id, :tee_time, :date_played, :round_num)
  end
end
