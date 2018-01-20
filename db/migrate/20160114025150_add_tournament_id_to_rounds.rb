class AddTournamentIdToRounds < ActiveRecord::Migration[5.1]
  def change
    add_reference :rounds, :tournament, index: true, foreign_key: true
  end
end
