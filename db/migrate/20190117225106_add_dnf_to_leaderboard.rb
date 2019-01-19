class AddDnfToLeaderboard < ActiveRecord::Migration[5.1]
  def change
    add_column :leaderboards, :dnf, :boolean, default: false
  end
end
