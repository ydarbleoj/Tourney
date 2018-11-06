class TournamentAgg < ApplicationRecord
  belongs_to :tournament

  has_many :scorecards, through: :tournament

end
