class AddLowestRoundIdToUserAgg < ActiveRecord::Migration[5.1]
  def change
    add_column :user_aggs, :lowest_round_id, :bigint
    add_column :user_aggs, :par3_avg, :decimal, default: 0.0
    add_column :user_aggs, :par4_avg, :decimal, default: 0.0
    add_column :user_aggs, :par5_avg, :decimal, default: 0.0
    add_column :user_aggs, :hcap_avg, :decimal, default: 0.0
  end
end
