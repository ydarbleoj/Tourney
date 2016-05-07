class AddTournamentRoundToScorecard < ActiveRecord::Migration
  def change
    add_reference :scorecards, :tournament_round, index: true, foreign_key: true
  end
end
