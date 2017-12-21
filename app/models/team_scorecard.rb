class TeamScorecard < ApplicationRecord
  belongs_to :new_course
  belongs_to :tournament_round
  belongs_to :round_tee_time


end
