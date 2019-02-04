class TournamentUsersSerializer
  include FastJsonapi::ObjectSerializer
  set_type :tournament_user
  set_id :id

  belongs_to :user
  belongs_to :tournament
end