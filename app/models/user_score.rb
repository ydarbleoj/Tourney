class UserScore < ActiveRecord::Base
  belongs_to :user
  belongs_to :scorecard

  validates :scorecard_id, presence: true
  validates :user_id, presence: true

  before_save :calculate_net

  def calculate_net
    course_par = self.scorecard.new_course.holes[self.number - 1].par
    course_hcap = self.scorecard.new_course.holes[self.number - 1].handicap
    self.net = self.handicap > course_hcap ? self.score - 1 : self.score
  end
end
