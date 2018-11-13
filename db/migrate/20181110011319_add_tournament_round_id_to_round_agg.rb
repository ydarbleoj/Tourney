class AddTournamentRoundIdToRoundAgg < ActiveRecord::Migration[5.1]
  def change
    add_column :round_aggs, :tournament_round_id, :bigint
    remove_column :round_aggs, :new_course_id
  end
end
