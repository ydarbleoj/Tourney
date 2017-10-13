class RemoveScorecardIdFromTournamentRound < ActiveRecord::Migration[5.1]
  def change
    remove_reference :tournament_rounds, :scorecard
  end
end
