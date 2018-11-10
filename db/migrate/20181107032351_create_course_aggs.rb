class CreateCourseAggs < ActiveRecord::Migration[5.1]
  def change
    create_table :course_aggs do |t|
      t.bigint :new_course_id
      t.decimal :gross_avg
      t.decimal :net_avg
      t.decimal :putts_avg
      t.decimal :three_putts_avg
      t.decimal :greens_in_reg
      t.decimal :par3_avg
      t.decimal :par4_avg
      t.decimal :par5_avg
      t.string :easiest_hole
      t.string :hardest_hole
      t.string :lowest_round
      t.string :highest_round
      t.timestamps
    end
  end
end
