class TournamentSerializer
  include FastJsonapi::ObjectSerializer
  set_type :tournament
  attributes :id, :name, :year, :num_players

  has_many :tournament_rounds
  has_many :new_courses, through: :tournament_rounds

  attribute :round_info do |object|
    object.tournament_rounds.sort_by(&:round_number).map do |x|
      {
        roundId: x.id,
        roundNumber: x.round_number,
        course: x.new_course.name,
      }
    end
  end
end
