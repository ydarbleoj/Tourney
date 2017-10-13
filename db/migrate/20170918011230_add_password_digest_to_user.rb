class AddPasswordDigestToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :password_digest, :string
    remove_column :users, :encrypted_password, :string
    remove_column :users, :reset_password_token, :string
  end
end
