class AddCountToRoundAgg < ActiveRecord::Migration[5.1]
  def change
    add_column :round_aggs, :count, :integer, default: 0
    add_column :round_aggs, :gross_avg, :integer, default: 0
    remove_column :round_aggs, :tournament_id
    change_column_default :round_aggs, :par3_avg, 0
    change_column_default :round_aggs, :par4_avg, 0
    change_column_default :round_aggs, :par5_avg, 0
    change_column_default :round_aggs, :net_avg, 0
    change_column_default :round_aggs, :putts_avg, 0
  end
end
