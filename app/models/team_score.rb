class TeamScore < ApplicationRecord
  belongs_to :team_scorecard

  validates :number, presence: true
  validates :net, presence: true
  validates :par, presence: true


end
