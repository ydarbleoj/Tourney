class AddTournamentRoundToScorecard < ActiveRecord::Migration[5.1]
  def change
    add_reference :scorecards, :tournament_round, index: true, foreign_key: true
  end
end
