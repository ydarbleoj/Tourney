class TournamentCreateSerializer
  include FastJsonapi::ObjectSerializer
  set_type :tournament
  set_id :id

  has_many :tournament_rounds

  attributes :name, :year, :start_date, :end_date, :num_players, :num_rounds, :id

  attribute :round_info do |object|
    dates = (object.start_date.to_datetime..object.end_date.to_datetime).to_a
    (1..object.num_rounds).map do |i|
      round = object.tournament_rounds.find_by(:round_number => i)
      course = round&.new_course

      {
        round_number: i,
        roundNumber: i,
        course: new_course&.name,
        roundId: round&.id,
        round_date: dates[i-1],
        display_date: dates[i-1].strftime("%a %d"),
      }
    end
  end
end
