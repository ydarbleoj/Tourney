class CreateUserScores < ActiveRecord::Migration
  def change
    create_table :user_scores do |t|
      t.references :scorecard, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.integer :number
      t.integer :score
      t.integer :putts
      t.boolean :skin, default: false
      t.integer :net

      t.timestamps null: false
    end
  end
end
