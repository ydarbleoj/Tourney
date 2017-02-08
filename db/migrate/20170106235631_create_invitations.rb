class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.string :email
      t.integer :tournament_id
      t.string :token
      t.string :first_name
      t.string :last_name
      t.boolean :accepted, default: false
      t.string :role

      t.timestamps null: false
    end
  end
end
