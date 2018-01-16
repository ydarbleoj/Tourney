class AddWonToTeamScorecard < ActiveRecord::Migration[5.1]
  def change
    add_column :team_scorecards, :is_won, :boolean, default: false
  end
end
