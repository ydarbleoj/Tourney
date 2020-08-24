# frozen_string_literal: true

class RenameTeamScorecardIdOnTeeTimes < ActiveRecord::Migration[5.1]
  def change
    rename_column :tee_times, :team_scorecard_id, :team_id
  end
end
