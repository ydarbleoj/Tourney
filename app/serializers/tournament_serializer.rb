class TournamentSerializer
  include FastJsonapi::ObjectSerializer
  set_type :tournament
  attributes :id, :name, :year, :num_players

end
