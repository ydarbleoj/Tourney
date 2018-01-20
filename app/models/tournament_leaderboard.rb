class TournamentLeaderboard < ApplicationRecord
  belongs_to :tournament
  has_many :tournament_rounds, through: :tournament
end
