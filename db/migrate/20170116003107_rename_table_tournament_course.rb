class RenameTableTournamentCourse < ActiveRecord::Migration
  def change
    rename_table :tournament_courses, :tournament_new_courses
  end
end
