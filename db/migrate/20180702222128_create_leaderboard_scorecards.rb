class CreateLeaderboardScorecards < ActiveRecord::Migration[5.1]
  def change
    create_table :leaderboard_scorecards do |t|
      t.integer :leaderboard_id
      t.integer :scorecard_id

      t.timestamps
    end
  end
end
