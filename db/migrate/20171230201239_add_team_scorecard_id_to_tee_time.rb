class AddTeamScorecardIdToTeeTime < ActiveRecord::Migration[5.1]
  def change
    add_column :tee_times, :team_scorecard_id, :integer
  end
end
