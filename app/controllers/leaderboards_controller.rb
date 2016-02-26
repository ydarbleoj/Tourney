class LeaderboardsController < ApplicationController

  def index
    @tournaments = current_user.tournaments.where("end_date < ?", Date.today).uniq
  end

  def execute

  end

  def new
  end

  def show

  end

  def edit
  end

  def create
    @leaderboard = Leaderboard.new(board_params)
    @rounds = Rounds.all

    @rounds.each do |r|
    end


  end

  private
    def board_params
      params.require(:leaderboard)
            .permit(:tournament_id, :user_id, :rnd1_score, :rnd1_putts, :rnd2_score, :rnd2_putts,
                    :rnd3_score, :rnd3_putts, :total_score, :total_putts, :net_total)
    end
end
