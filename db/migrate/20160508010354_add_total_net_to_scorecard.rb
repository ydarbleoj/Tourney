class AddTotalNetToScorecard < ActiveRecord::Migration[5.1]
  def change
    add_column :scorecards, :total_net, :integer
  end
end
