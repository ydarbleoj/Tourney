class CreateStrokeMoneys < ActiveRecord::Migration[5.1]
  def change
    create_table :stroke_moneys do |t|
      t.integer :tournament_id
      t.integer :user_id
      t.integer :position
      t.integer :money, default: 0

      t.timestamps
    end
  end
end
