class CreateTournamentRounds < ActiveRecord::Migration[5.1]
  def change
    create_table :tournament_rounds do |t|
      t.references :tournament, index: true, foreign_key: true
      t.references :scorecard, index: true, foreign_key: true
      t.integer :round_number
      t.datetime :tee_time
      t.datetime :tee_time_date
      t.integer :group_number

      t.timestamps null: false
    end
  end
end
