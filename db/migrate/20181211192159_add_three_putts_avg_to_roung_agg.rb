class AddThreePuttsAvgToRoungAgg < ActiveRecord::Migration[5.1]
  def change
    add_column :round_aggs, :three_putts_avg, :decimal, precision: 3, scale: 1, default: 0.0, null: false
  end
end
