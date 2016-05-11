class AddTournamentIdToScorecard < ActiveRecord::Migration
  def change
    add_column :scorecards, :round_num, :integer
    add_reference :scorecards, :tournament, index: true, foreign_key: true
  end
end
