class AddTotalNetToScorecard < ActiveRecord::Migration
  def change
    add_column :scorecards, :total_net, :integer
  end
end
