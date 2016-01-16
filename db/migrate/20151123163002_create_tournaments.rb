class CreateTournaments < ActiveRecord::Migration
  def change
    create_table :tournaments do |t|
      t.string :name
      t.integer :year
      t.integer :num_players
      t.integer :num_rounds
      t.datetime :end_date
      
      t.timestamps null: false
    end
  end
end
