class AddCountToUserCourseAgg < ActiveRecord::Migration[5.1]
  def change
    add_column :user_course_aggs, :count, :integer, default: 0
  end
end
