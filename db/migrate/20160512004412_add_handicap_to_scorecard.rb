class AddHandicapToScorecard < ActiveRecord::Migration
  def change
    add_column :scorecards, :handicap, :integer
  end
end
