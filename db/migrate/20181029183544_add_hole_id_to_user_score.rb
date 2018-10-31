class AddHoleIdToUserScore < ActiveRecord::Migration[5.1]
  def change
    add_column :user_scores, :hole_id, :integer, index: true
    add_column :user_scores, :number, :integer, default: 1
  end
end
