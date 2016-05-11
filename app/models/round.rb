class Round < ActiveRecord::Base
  belongs_to :user
  belongs_to :course
  belongs_to :tournament
  belongs_to :leaderboard
  validates :user_id, presence: true
  validates :course_id, presence: true
  # after_update :shots_calculation

  before_save :calculate_net

  # def calculate_net
  #   course_par = self.scorecard.new_course.holes[self.number - 1].par
  #   course_hcap = self.scorecard.new_course.holes[self.number - 1].handicap

  #   if self.handicap < 19
  #     self.net = self.handicap >= course_hcap ? self.score - 1 : self.score
  #   else
  #     new_cap = self.handicap - 18
  #     self.net = new_cap >= course_hcap ? self.score - 2 : self.score - 1
  #   end
  # end

end
