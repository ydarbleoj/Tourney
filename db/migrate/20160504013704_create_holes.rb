class CreateHoles < ActiveRecord::Migration[5.1]
  def change
    create_table :holes do |t|
      t.integer :number
      t.integer :par
      t.integer :yards
      t.integer :handicap
      t.references :new_course, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
