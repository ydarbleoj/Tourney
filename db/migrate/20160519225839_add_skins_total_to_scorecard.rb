class AddSkinsTotalToScorecard < ActiveRecord::Migration[5.1]
  def change
    add_column :scorecards, :net_skin_total, :integer
    add_column :scorecards, :gross_skin_total, :integer
  end
end
