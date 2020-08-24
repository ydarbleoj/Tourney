# frozen_string_literal: true

class RenameTeamScorecardIdOnTeamScores < ActiveRecord::Migration[5.1]
  def change
    rename_column :team_scores, :team_scorecard_id, :team_id
  end
end
