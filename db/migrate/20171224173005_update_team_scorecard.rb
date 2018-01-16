class UpdateTeamScorecard < ActiveRecord::Migration[5.1]
  def change
    remove_column :team_scorecards, :round_tee_time_id
    add_column :team_scorecards, :group, :string
  end
end
