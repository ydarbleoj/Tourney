class AddHcapDiffToCourseAgg < ActiveRecord::Migration[5.1]
  def change
    add_column :course_aggs, :hcap_diff, :decimal, precision: 3, scale: 1, default: "0.0", null: false
  end
end
