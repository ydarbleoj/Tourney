class CreateRoundTeeTimes < ActiveRecord::Migration
  def change
    create_table :round_tee_times do |t|
      t.references :tournament_round, index: true, foreign_key: true
      t.string :group
      t.string :player_one
      t.string :player_two
      t.string :player_three
      t.string :player_four
      t.datetime :tee_time

      t.timestamps null: false
    end
  end
end
