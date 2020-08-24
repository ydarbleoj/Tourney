# frozen_string_literal: true

class AddUserScoreIdsToTeamScores < ActiveRecord::Migration[5.1]
  def change
    add_column :team_scores, :score_1_id, :integer
    add_column :team_scores, :score_2_id, :integer
  end
end
