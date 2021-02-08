# frozen_string_literal: true

class AddPositionToTeamCard < ActiveRecord::Migration[5.2]
  def change
    add_column :team_cards, :position, :integer, :default => 0
  end
end
