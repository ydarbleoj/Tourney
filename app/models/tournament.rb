class Tournament < ActiveRecord::Base
	has_many :rounds
	has_many :courses, through: :rounds
	has_many :users, through: :rounds
end
