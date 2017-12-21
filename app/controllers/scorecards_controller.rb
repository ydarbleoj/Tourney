class ScorecardsController < ApplicationController
  before_action :authenticate_user
  before_action :set_tournament

  def index
    @scorecards = current_user.scorecards.order(created_at: :asc).where(finished: true)
  end

  def show
    p "SCORECARD"
    scorecard = Scorecard.find(params[:id])
    scores = scorecard.user_scores.order(number: :asc)

    payload = [{ scorecard: scorecard, scores: scores }]
    render json: payload
  end

  def destroy
    @scorecard = Scorecard.find(params[:id]).destroy
    redirect_to tournament_scorecards_path(@current_tourn.id)
  end

  private
  def set_tournament
    @tournament = Tournament.find(params[:tournament_id])
  end

  def scorecard_params
    params.require(:scorecard).permit(:total_score, :total_putts, :total_3putts,
      :new_course_id, :user_id, :tournament_round_id, :total_net, :handicap,
      user_scores_attributes: [:id, :number, :score, :putts, :skin, :net, :handicap, :net_skin])
  end

end