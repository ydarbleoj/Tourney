class AddTournamentIdToRounds < ActiveRecord::Migration
  def change
    add_reference :rounds, :tournament, index: true, foreign_key: true
  end
end
