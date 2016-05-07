class RemoveUserIdFromUserScores < ActiveRecord::Migration
  def change
    remove_reference :user_scores, :user
  end
end
