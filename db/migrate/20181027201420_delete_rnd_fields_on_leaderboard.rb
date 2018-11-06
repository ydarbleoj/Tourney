class DeleteRndFieldsOnLeaderboard < ActiveRecord::Migration[5.1]
  def change
    remove_column :leaderboards, :rnd1_score
    remove_column :leaderboards, :rnd2_score
    remove_column :leaderboards, :rnd3_score
    remove_column :leaderboards, :rnd1_putts
    remove_column :leaderboards, :rnd2_putts
    remove_column :leaderboards, :rnd3_putts
    # remove_column :leaderboards, :rnd1_3putts
    remove_column :leaderboards, :rnd2_3putts
    remove_column :leaderboards, :rnd3_3putts
  end
end
