class AddUserCourseAggIdToUserHoleAgg < ActiveRecord::Migration[5.1]
  def change
    add_column :user_hole_aggs, :user_course_agg_id, :bigint
    remove_column :user_hole_aggs, :new_course_id
  end
end
