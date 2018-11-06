class CreateUserCourseAggs < ActiveRecord::Migration[5.1]
  def change
    create_table :user_course_aggs do |t|
      t.bigint :user_id
      t.bigint :new_course_id
      t.decimal :gross_avg
      t.decimal :net_avg
      t.decimal :putts_avg
      t.decimal :three_putts_avg
      t.decimal :greens_in_reg
      t.decimal :par3_avg
      t.decimal :par4_avg
      t.decimal :par5_avg
      t.integer :easiest_hole
      t.integer :hardest_hole
      t.timestamps
    end
  end
end
