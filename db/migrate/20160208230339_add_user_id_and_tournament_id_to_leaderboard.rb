class AddUserIdAndTournamentIdToLeaderboard < ActiveRecord::Migration[5.1]
  def change
  	add_reference :leaderboards, :tournament, index: true, forgein_key: true
  	add_reference :leaderboards, :user, index: true, forgein_key: true
  end
end
