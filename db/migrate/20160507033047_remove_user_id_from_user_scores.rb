class RemoveUserIdFromUserScores < ActiveRecord::Migration[5.1]
  def change
    remove_reference :user_scores, :user
  end
end
