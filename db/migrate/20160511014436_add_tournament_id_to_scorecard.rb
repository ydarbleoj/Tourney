class AddTournamentIdToScorecard < ActiveRecord::Migration[5.1]
  def change
    add_column :scorecards, :round_num, :integer
    add_reference :scorecards, :tournament, index: true, foreign_key: true
  end
end
