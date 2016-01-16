class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.references :user, index: true, foreign_key: true
      t.references :course, index: true, foreign_key: true
      t.integer :score
      t.integer :putts
      t.integer :round_num
      t.datetime :date_played

      t.timestamps null: false
    end
  end
end
