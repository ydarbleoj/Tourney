class Course < ActiveRecord::Base
	has_many :rounds
	has_many :users, through: :rounds
	has_many :tournaments, through: :rounds
end
