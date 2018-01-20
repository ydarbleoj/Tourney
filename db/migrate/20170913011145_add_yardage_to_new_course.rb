class AddYardageToNewCourse < ActiveRecord::Migration[5.1]
  def change
    add_column :new_courses, :yardage, :integer
  end
end
