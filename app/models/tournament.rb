class Tournament < ActiveRecord::Base
	has_many :rounds
	has_many :courses, through: :rounds
	has_many :users, through: :rounds
	has_many :leaderboards
	accepts_nested_attributes_for :rounds
end
