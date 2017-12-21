class CreateTeamMoneys < ActiveRecord::Migration[5.1]
  def change
    create_table :team_moneys do |t|
      t.integer :tournament_id
      t.integer :user_id
      t.integer :round_one, default: 0
      t.integer :round_two, default: 0
      t.integer :round_three, default: 0
      t.integer :total, default: 0

      t.timestamps
    end
  end
end
