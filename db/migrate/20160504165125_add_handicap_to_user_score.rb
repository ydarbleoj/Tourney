class AddHandicapToUserScore < ActiveRecord::Migration
  def change
    add_column :user_scores, :handicap, :integer
  end
end
