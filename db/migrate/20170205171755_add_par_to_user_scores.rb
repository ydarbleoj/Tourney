class AddParToUserScores < ActiveRecord::Migration
  def change
    add_column :user_scores, :par, :integer
  end
end
