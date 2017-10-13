class CreateTournamentCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :tournament_courses do |t|
      t.belongs_to :new_course
      t.belongs_to :tournament
      t.integer :round_num

      t.timestamps null: false
    end
  end
end
