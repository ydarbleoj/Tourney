class RemoveHoleFieldsFromUserScore < ActiveRecord::Migration[5.1]
  def change
    remove_column :user_scores, :par
    remove_column :user_scores, :handicap
    remove_column :user_scores, :number
  end
end
