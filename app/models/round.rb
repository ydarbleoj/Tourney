class Round < ActiveRecord::Base
  belongs_to :user
  belongs_to :course
  belongs_to :tournament

  validates :user_id, presence: true
  validates :course_id, presence: true
end
