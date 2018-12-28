class UpdateRoundAggTypesFromIntegerToDecimal < ActiveRecord::Migration[5.1]
   def up
    change_column :round_aggs, :par3_avg, :decimal, default: 0
    change_column :round_aggs, :par4_avg, :decimal, default: 0
    change_column :round_aggs, :par5_avg, :decimal, default: 0
    change_column :round_aggs, :net_avg, :decimal, default: 0
    change_column :round_aggs, :gross_avg, :decimal, default: 0
    change_column :round_aggs, :putts_avg, :decimal, default: 0
  end

  def down
    change_column :round_aggs, :par3_avg, :integer, default: 0
    change_column :round_aggs, :par4_avg, :integer, default: 0
    change_column :round_aggs, :par5_avg, :integer, default: 0
    change_column :round_aggs, :net_avg, :integer, default: 0
    change_column :round_aggs, :gross_avg, :integer, default: 0
    change_column :round_aggs, :putts_avg, :integer, default: 0
  end
end
