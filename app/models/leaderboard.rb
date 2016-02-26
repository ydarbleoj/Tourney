class Leaderboard < ActiveRecord::Base
	belongs_to :tournament
	belongs_to :user
	has_many :rounds, through: :tournaments
	# has_many :users, through: :tournaments


end
