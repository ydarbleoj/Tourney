class AddUserIdAndTournamentIdToLeaderboard < ActiveRecord::Migration
  def change
  	add_reference :leaderboards, :tournament, index: true, forgein_key: true
  	add_reference :leaderboards, :user, index: true, forgein_key: true
  end
end
