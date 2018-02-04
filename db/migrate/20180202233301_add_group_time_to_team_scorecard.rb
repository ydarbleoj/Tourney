class AddGroupTimeToTeamScorecard < ActiveRecord::Migration[5.1]
  def change
    add_column :team_scorecards, :group_time, :datetime
  end
end
