class AddParToUserScores < ActiveRecord::Migration[5.1]
  def change
    add_column :user_scores, :par, :integer
  end
end
