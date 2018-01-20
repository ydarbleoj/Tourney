class Course < ApplicationRecord
	has_many :rounds
	has_many :users, through: :rounds
	has_many :tournaments, through: :rounds
end
