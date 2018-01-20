class CreateTeamScores < ActiveRecord::Migration[5.1]
  def change
    create_table :team_scores do |t|
      t.integer :team_scorecard_id
      t.integer :number
      t.integer :net
      t.integer :par

      t.timestamps
    end
  end
end
