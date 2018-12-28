class AddLeaderboardIdToSkinsMoney < ActiveRecord::Migration[5.1]
  def change
    add_column :skins_moneys, :leaderboard_id, :integer
  end
end
