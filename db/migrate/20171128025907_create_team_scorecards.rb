class CreateTeamScorecards < ActiveRecord::Migration[5.1]
  def change
    create_table :team_scorecards do |t|
      t.integer :round_tee_time_id
      t.integer :new_course_id
      t.integer :tournament_round_id
      t.boolean :finished, default: false
      t.integer :total_net, default: 0

      t.timestamps
    end
  end
end
