class Tournament < ActiveRecord::Base
	has_many :rounds
	has_many :courses, through: :rounds
	has_many :users, through: :rounds
	has_many :leaderboards
  # has_many :tournament_rounds
  has_many :scorecards
  has_many :users, through: :scorecards

  has_one :tournament_leaderboard

	accepts_nested_attributes_for :rounds
  accepts_nested_attributes_for :scorecards
end
