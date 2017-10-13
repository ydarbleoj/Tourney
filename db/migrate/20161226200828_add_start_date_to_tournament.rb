class AddStartDateToTournament < ActiveRecord::Migration[5.1]
  def change
    add_column :tournaments, :start_date, :datetime
  end
end
