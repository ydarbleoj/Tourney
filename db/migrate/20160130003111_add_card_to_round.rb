class AddCardToRound < ActiveRecord::Migration
  def change
    add_column :rounds, :shots_card, :hstore, default: '', null: false
    add_index :rounds, :shots_card, using: :gin
    add_column :rounds, :putts_card, :hstore, default: '', null: false
    add_index :rounds, :putts_card, using: :gin
  end
end
