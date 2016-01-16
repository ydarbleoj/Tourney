class TournamentsController < ApplicationController
  def index
    @tournaments = Tournament.all
  end

  def show
    @tournament = Tournament.find(params[:id])
  end

  def new
    @tournament = Tournament.new
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
  end

  def update
  end

  def tourn_params
    params.require(:tournament).permit(:name, :year, :num_players, :num_rounds)
  end
end
