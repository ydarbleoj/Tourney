class AddLowestRoundIdToUserCourseAgg < ActiveRecord::Migration[5.1]
  def change
    add_column :user_course_aggs, :lowest_round_id, :bigint
  end
end
