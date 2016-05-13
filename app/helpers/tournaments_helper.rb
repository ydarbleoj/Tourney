module TournamentsHelper

	def history
		@tournaments = Tournaments.all
	end

  def user_tournaments
    @user_tournaments = current_user.tournaments.uniq.select {|x| x.id }.map {|x| x.id }
  end

end
