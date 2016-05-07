class RemoveScorecardIdFromTournamentRound < ActiveRecord::Migration
  def change
    remove_reference :tournament_rounds, :scorecard
  end
end
