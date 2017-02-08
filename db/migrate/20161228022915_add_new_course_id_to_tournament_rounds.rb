class AddNewCourseIdToTournamentRounds < ActiveRecord::Migration
  def change
    add_column :tournament_rounds, :new_course_id, :integer
    add_index :tournament_rounds, :new_course_id
  end
end
