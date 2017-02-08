class CreateTournamentUsers < ActiveRecord::Migration
  def change
    create_table :tournament_users do |t|
      t.belongs_to :user, index: true
      t.belongs_to :tournament, index: true
      t.string :role, default: 'member'

      t.timestamps null: false
    end
  end
end
