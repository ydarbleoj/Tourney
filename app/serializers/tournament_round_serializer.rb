class TournamentRoundSerializer
  include FastJsonapi::ObjectSerializer
  set_type :tournament_round
  set_id :id

  belongs_to :tournament
  attributes :round_number, :round_date, :new_course_id
end