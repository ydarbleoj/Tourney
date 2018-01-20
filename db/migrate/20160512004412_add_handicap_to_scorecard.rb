class AddHandicapToScorecard < ActiveRecord::Migration[5.1]
  def change
    add_column :scorecards, :handicap, :integer
  end
end
