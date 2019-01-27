class ChangeTypeOnEasiestUserHoleAgg < ActiveRecord::Migration[5.1]
  def change
    remove_column :user_course_aggs, :easiest_hole, :integer
    remove_column :user_course_aggs, :hardest_hole, :integer
    add_column :user_course_aggs, :easiest_hole_id, :bigint
    add_column :user_course_aggs, :hardest_hole_id, :bigint
  end
end
