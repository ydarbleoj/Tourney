class AddLeaderboardIdToTournamentLeaderboards < ActiveRecord::Migration[5.1]
  def change
    add_column :tournament_leaderboards, :leaderboard_id, :integer
  end
end
