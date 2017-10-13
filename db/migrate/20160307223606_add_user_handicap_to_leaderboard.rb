class AddUserHandicapToLeaderboard < ActiveRecord::Migration[5.1]
  def change
    add_column :leaderboards, :handicap, :integer
  end
end
