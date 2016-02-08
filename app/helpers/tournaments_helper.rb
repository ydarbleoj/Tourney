module TournamentsHelper

	def history
		@tournaments = Tournaments.all
	end
end
