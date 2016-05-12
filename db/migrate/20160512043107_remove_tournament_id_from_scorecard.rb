class RemoveTournamentIdFromScorecard < ActiveRecord::Migration
  def change
    remove_reference :scorecards, :tournament
  end
end
