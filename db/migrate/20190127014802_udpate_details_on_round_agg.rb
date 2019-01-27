class UdpateDetailsOnRoundAgg < ActiveRecord::Migration[5.1]
  def change
    remove_column :round_aggs, :net_lowest, :string
    remove_column :round_aggs, :hardest_hole, :string
    remove_column :round_aggs, :easiest_hole, :string
    add_column :round_aggs, :lowest_round_id, :bigint
    add_column :round_aggs, :easiest_hole_id, :bigint
    add_column :round_aggs, :hardest_hole_id, :bigint
    add_column :round_aggs, :hcap_diff, :decimal, precision: 3, scale: 1, default: "0.0", null: false
  end
end
