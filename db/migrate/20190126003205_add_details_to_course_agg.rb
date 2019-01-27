class AddDetailsToCourseAgg < ActiveRecord::Migration[5.1]
  def change
    remove_column :course_aggs, :easiest_hole, :string
    remove_column :course_aggs, :hardest_hole, :string
    remove_column :course_aggs, :lowest_round, :string
    remove_column :course_aggs, :highest_round, :string
    add_column :course_aggs, :easiest_hole_id, :bigint
    add_column :course_aggs, :hardest_hole_id, :bigint
    add_column :course_aggs, :lowest_round_id, :bigint
  end
end
