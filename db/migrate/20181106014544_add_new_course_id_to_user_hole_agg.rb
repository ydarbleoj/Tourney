class AddNewCourseIdToUserHoleAgg < ActiveRecord::Migration[5.1]
  def change
    add_column :user_hole_aggs, :new_course_id, :integer
  end
end
