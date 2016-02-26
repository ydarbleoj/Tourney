class Round < ActiveRecord::Base
  belongs_to :user
  belongs_to :course
  belongs_to :tournament
  belongs_to :leaderboard
  validates :user_id, presence: true
  validates :course_id, presence: true
  # after_update :shots_calculation


end
