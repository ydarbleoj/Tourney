class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.integer :rating
      t.integer :slope
      t.string :tee
      t.string :city
      t.string :state

      t.timestamps null: false
    end
  end
end
