class TournamentRoundsController < ApplicationController
  before_filter :check_for_user
  # before_filter :current_tourn

  def index
    @tourn_rounds = TournamentRound.all
  end

  def current_tourn
    @current_tourn = Tournament.where("end_date > ?", Date.today).first
  end

  private
  def tourn_rounds_params
    params.require(:tournament_round).permit(:round_number,
      scorecards_attributes: [:user_id, :new_course_id, :total_score, :total_putts, :handicap, :total_3putts])
  end
end