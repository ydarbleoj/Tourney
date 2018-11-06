class CreateRoundAggs < ActiveRecord::Migration[5.1]
  def change
    create_table :round_aggs do |t|
      t.references :tournament, foreign_key: true
      t.integer :new_course_id
      t.string :net_lowest
      t.integer :par3_avg
      t.integer :par4_avg
      t.integer :par5_avg
      t.string :hardest_hole
      t.string :easiest_hole
      t.integer :net_avg
      t.integer :putts_avg

      t.timestamps
    end
  end
end
