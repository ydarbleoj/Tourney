module  RoundTeeTimesHelper

  def players_select
    @players = @current_tournament.users.collect {|x| [x.username] }
  end
end