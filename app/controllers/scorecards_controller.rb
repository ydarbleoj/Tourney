class ScorecardsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :current_tournament, only: [:show]

  def index
    @scorecards = current_user.scorecards.order(created_at: :asc).where(finished: true)
  end

  def show
   p @scorecard = Scorecard.where(id: params[:id]).first
    @user_scores = @scorecard.user_scores.order(number: :asc)
    @course = NewCourse.joins(:holes).where(id: @scorecard.new_course_id).first
  end

  def display
    @scorecard = Scorecard.where(id: params[:id]).first
    p @user_scores = @scorecard.user_scores.order(number: :asc)
    p @course = NewCourse.joins(:holes).where(id: @scorecard.new_course_id).first
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

  def current_tournament
    @tournament = Tournament.find(params[:tournament_id])
  end

  private

  def scorecard_params
    params.require(:scorecard).permit(:total_score, :total_putts, :total_3putts,
      :new_course_id, :user_id, :tournament_round_id, :total_net, :handicap,
      user_scores_attributes: [:id, :number, :score, :putts, :skin, :net, :handicap, :net_skin])
  end

end