class AddDnfToScorecard < ActiveRecord::Migration[5.1]
  def change
    add_column :scorecards, :dnf, :boolean, default: false
  end
end
