class UpdateRn13PuttsOnLeaderboard < ActiveRecord::Migration[5.1]
  def change
    rename_column :leaderboards, :rn1_3putts, :rnd1_3putts
  end
end
