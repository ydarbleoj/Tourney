# frozen_string_literal: true

class CreateTeamCards < ActiveRecord::Migration[5.2]
  def change
    create_table :team_cards do |t|
      t.references :team, foreign_key: true
      t.references :scorecard, foreign_key: true

      t.timestamps
    end
  end
end
