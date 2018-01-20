class CreateTeeTimes < ActiveRecord::Migration[5.1]
  def change
    create_table :tee_times do |t|
      t.integer :user_id
      t.integer :tournament_round_id
      t.datetime :tee_time
      t.string :group

      t.timestamps
    end
  end
end
