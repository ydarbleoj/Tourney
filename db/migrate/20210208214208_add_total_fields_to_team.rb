# frozen_string_literal: true

class AddTotalFieldsToTeam < ActiveRecord::Migration[5.2]
  def change
    add_column :teams, :total_score, :integer, :default => 0
    add_column :teams, :total_putts, :integer, :default => 0
  end
end
