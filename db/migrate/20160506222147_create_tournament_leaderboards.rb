class CreateTournamentLeaderboards < ActiveRecord::Migration[5.1]
  def change
    create_table :tournament_leaderboards do |t|
      t.references :tournament, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
