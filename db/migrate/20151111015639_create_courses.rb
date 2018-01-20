class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.string :name
      t.decimal :rating
      t.integer :slope
      t.integer :par
      t.string :tee
      t.string :city
      t.string :state
      t.integer :yardage

      t.timestamps null: false
    end
  end
end
