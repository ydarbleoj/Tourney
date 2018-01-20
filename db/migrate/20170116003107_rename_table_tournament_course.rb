class RenameTableTournamentCourse < ActiveRecord::Migration[5.1]
  def change
    rename_table :tournament_courses, :tournament_new_courses
  end
end
