class CreateTournamentAggs < ActiveRecord::Migration[5.1]
  def change
    create_table :tournament_aggs do |t|
      t.references :tournament
      t.integer :putts_avg
      t.integer :net_avg
      t.string :lowest_round
      t.string :highest_round
      t.integer :par3_avg
      t.integer :par4_avg
      t.integer :par5_avg
      t.string :hardest_hole
      t.string :easiest_hole

      t.timestamps
    end
  end
end
