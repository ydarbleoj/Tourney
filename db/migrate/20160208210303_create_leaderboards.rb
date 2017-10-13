class CreateLeaderboards < ActiveRecord::Migration[5.1]
  def change
    create_table :leaderboards do |t|
      t.integer :rnd1_score
      t.integer :rnd2_score
      t.integer :rnd3_score
      t.integer :rnd1_putts
      t.integer :rnd2_putts
      t.integer :rnd3_putts
      t.integer :total_score
      t.integer :total_putts
      t.integer :total_3_putts
      t.integer :net_total

      t.timestamps null: false
    end
  end
end
