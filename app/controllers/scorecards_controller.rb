class ScorecardsController < ApplicationController
  before_filter :check_for_user
  before_filter :current_tourn

  def index
    @scorecards = Scorecard.all
  end

  def show
    @scorecard = current_user
  end

  def edit
    @scorecard = Scorecard.find(params[:id])
    @scorecard.user_scores.each { |user_score| user_score.score }
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