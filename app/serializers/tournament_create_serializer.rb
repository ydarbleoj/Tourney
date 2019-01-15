class TournamentCreateSerializer
  include FastJsonapi::ObjectSerializer
  set_type :tournament
  set_id :id

  attributes :name, :year, :start_date, :end_date, :num_players, :num_rounds

  attribute :round_info do |object|
    dates = (object.start_date.to_datetime..object.end_date.to_datetime).to_a
    (1..object.num_rounds).map do |i|
      {
        round_number: i,
        round_date: dates[i-1],
        display_date: dates[i-1].strftime("%a %d"),
      }
    end
  end
end