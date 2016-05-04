class CreateNewCourses < ActiveRecord::Migration
  def change
    create_table :new_courses do |t|
      t.string :name
      t.integer :slope
      t.integer :rating
      t.string :tee
      t.string :state
      t.string :city
      t.integer :par

      t.timestamps null: false
    end
  end
end
