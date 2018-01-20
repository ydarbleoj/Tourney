class CreateRounds < ActiveRecord::Migration[5.1]
  def change
    create_table :rounds do |t|
      t.references :user, index: true, foreign_key: true
      t.references :course, index: true, foreign_key: true
      t.integer :score
      t.integer :putts
      t.integer :handicap
      t.integer :round_num
      t.datetime :date_played
      t.datetime :tee_time

      t.timestamps null: false
    end
  end
end
