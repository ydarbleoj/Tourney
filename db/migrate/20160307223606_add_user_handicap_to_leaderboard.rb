class AddUserHandicapToLeaderboard < ActiveRecord::Migration
  def change
    add_column :leaderboards, :handicap, :integer
  end
end
