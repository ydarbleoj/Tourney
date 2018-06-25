class LeaderboardsController < ApplicationController
  before_action :authenticate_user
  before_action :set_tournament

  def index
    @tournaments = current_user.tournaments.where("end_date < ?", Date.today).uniq
  end

  def new
  end

  def update
    p 'Leaderboard3'
    hcap = factor_handicap(params[:params]['handicap'])

    Leaderboard.find(params[:id]).update(handicap: factor_handicap(params[:params]['handicap']))
    @tournament.scorecards.where(user_id: current_user).update_all(handicap: hcap)

    render json: 'success'
  end

  private
  def factor_handicap(handicap)
    ((handicap.to_i * 0.9).to_f).round
  end

  def set_tournament
    @tournament = Tournament.find(params[:tournament_id])
  end

  def board_params
    params.require(:leaderboard)
          .permit(:tournament_id, :user_id, :rnd1_score, :rnd1_putts, :rnd2_score, :rnd2_putts,
                  :rnd3_score, :rnd3_putts, :total_score, :total_putts, :net_total, :rnd1_3putts, :rnd2_3putts, :rnd3_3putts)
  end
end
