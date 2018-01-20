class RemoveTournamentIdFromScorecard < ActiveRecord::Migration[5.1]
  def change
    remove_reference :scorecards, :tournament
  end
end
