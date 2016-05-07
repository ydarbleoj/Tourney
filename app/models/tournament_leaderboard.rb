class TournamentLeaderboard < ActiveRecord::Base
  belongs_to :tournament
  has_many :tournament_rounds, through: :tournament
end
