class RemoveColumnsFromTournamentRound < ActiveRecord::Migration
  def change
    remove_column :tournament_rounds, :group_number, :integer
    rename_column :tournament_rounds, :tee_time, :round_date
  end
end
