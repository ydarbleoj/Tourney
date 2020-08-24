# frozen_string_literal: true

class RenameTeamScorecardToTeam < ActiveRecord::Migration[5.1]
  def change
    rename_table :team_scorecards, :teams
  end
end
