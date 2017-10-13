class AddNetSkinToUserScore < ActiveRecord::Migration[5.1]
  def change
    add_column :user_scores, :net_skin, :boolean, default: false
  end
end
