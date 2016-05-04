class CreateScorecards < ActiveRecord::Migration
  def change
    create_table :scorecards do |t|
      t.integer :total_score
      t.integer :total_putts
      t.integer :total_3putts
      t.references :new_course, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
