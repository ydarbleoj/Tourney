class ScorecardsController < ApplicationController
  before_filter :check_for_user
  before_filter :current_tourn

  def index
    p params
    @tournament = Tournament.find(params[:tournament_id])
    @scorecards = @tournament.scorecards
  end

  def show
    @scorecard = current_user
  end

  def edit
    @scorecard = Scorecard.find(params[:id])
    @user_scores = @scorecard.user_scores
  end

  def update
    @scorecard = Scorecard.find(params[:id])

    respond_to do |format|
      if @scorecard.update(scorecard_params)
        format.html { redirect_to edit_scorecard_path(@scorecard.id) }
      end
    end
  end

  def destroy
    @scorecard = Scorecard.find(params[:id]).destroy
    redirect_to tournament_scorecards_path(@current_tourn.id)
  end

  def current_tourn
    @current_tourn = Tournament.where("end_date > ?", Date.today).first
  end

  private

  def scorecard_params
    params.require(:scorecard).permit(:total_score, :total_putts, :total_3putts,
      :new_course_id, :user_id, :tournament_round_id, :total_net, :handicap,
      :net_skin_total, :gross_skin_total, user_scores_attributes: [:id, :number, :score, :putts, :skin, :net, :handicap, :net_skin])
  end

end