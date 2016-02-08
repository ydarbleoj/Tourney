class AddScorecardToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :scorecard, :hstore, default: '', null: false
    add_index :courses, :scorecard, using: :gin
  end
end
