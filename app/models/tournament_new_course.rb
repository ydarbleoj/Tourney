class TournamentNewCourse < ActiveRecord::Base
  belongs_to :new_course
  belongs_to :tournament
end
