class AddThreePuttPerRoundToLeaderboard < ActiveRecord::Migration[5.1]
  def change
    add_column :leaderboards, :rn1_3putts, :integer
    add_column :leaderboards, :rnd2_3putts, :integer
    add_column :leaderboards, :rnd3_3putts, :integer
  end
end
