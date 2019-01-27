class AddHcapDiffToUserCourseAgg < ActiveRecord::Migration[5.1]
  def change
    add_column :user_course_aggs, :hcap_diff, :decimal, default: 0.0
  end
end
