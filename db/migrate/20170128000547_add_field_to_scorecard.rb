class AddFieldToScorecard < ActiveRecord::Migration[5.1]
  def change
    add_column :scorecards, :finished, :boolean, default: false
  end
end
