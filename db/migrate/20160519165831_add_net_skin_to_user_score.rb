class AddNetSkinToUserScore < ActiveRecord::Migration
  def change
    add_column :user_scores, :net_skin, :boolean, default: false
  end
end
