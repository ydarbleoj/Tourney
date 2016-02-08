class TournamentsController < ApplicationController
  def index
    @tournaments = Tournament.all
    @tournament = current_user.tournaments.where("end_date > ?", Date.today)
  end

  def show
    @tournament = current_user.tournaments.where("end_date < ?", Date.today).first
    stroke_leaderboard
  end

  def new
    @tournament = Tournament.new
    @tournaments = Tournament.all
  end

  def create
   @tournament = Tournament.new(tourn_params)

   if @tournament.save
     flash[:succes] = "New Tournament Created"
     redirect_to @tournament
   else
     redirect_to tournaments_path
   end
  end

  def edit
    @tournament = Tournament.find(params[:id])
  end

  def update
    @tournament = Tournament.find(params[:id])

    if @tournament.update(user_params)
      redirect_to @tournament
    else
      render "edit"
    end
  end

  def history
    @tournaments = Tournament.where("end_date < ?", Date.today)
  end

  def stroke_leaderboard
    @rnd1_scores = @tournament.rounds.sum(:score, group: [:round_num]) #.sum(:user_id, :score, conditions: {round_num: [1,2,3]})
  end

  private
    def tourn_params
      params.require(:tournament).permit(:name, :year, :num_players, :num_rounds)
    end
end
