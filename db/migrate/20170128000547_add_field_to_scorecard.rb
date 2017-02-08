class AddFieldToScorecard < ActiveRecord::Migration
  def change
    add_column :scorecards, :finished, :boolean, default: false
  end
end
