class AddLeaderboardIdToScorecard < ActiveRecord::Migration[5.1]
  def change
    add_column :scorecards, :leaderboard_id, :integer
  end
end
