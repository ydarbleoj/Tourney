class TournamentAgg < ApplicationRecord
  belongs_to :tournament

  has_many :scorecards, through: :tournament

  has_many :round_aggs, through: :tournament
end
