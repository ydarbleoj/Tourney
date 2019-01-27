class AddHcapDiffToUserAgg < ActiveRecord::Migration[5.1]
  def change
    add_column :user_aggs, :hcap_diff, :decimal, default: 0.0
  end
end
