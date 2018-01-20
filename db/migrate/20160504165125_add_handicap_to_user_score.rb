class AddHandicapToUserScore < ActiveRecord::Migration[5.1]
  def change
    add_column :user_scores, :handicap, :integer
  end
end
