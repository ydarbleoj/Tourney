class Round < ActiveRecord::Base
  belongs_to :user
  belongs_to :course
  belongs_to :tournament, dependent: :destroy
  belongs_to :leaderboard
  validates :user_id, presence: true
  validates :course_id, presence: true
  # after_update :shots_calculation

  # before_save :calculate_net
  # before_save :set_hanidcap


  def set_handicap
    self.handicap = self.user.handicap
  end

  def calculate_net
     p 'here'
    course_par = self.new_course.holes[self.number - 1].par
    course_hcap = self.new_course.holes[self.number - 1].handicap

    # if self.handicap < 19
    #   self.net = self.handicap >= course_hcap ? self.score - 1 : self.score
    # else
    #   new_cap = self.handicap - 18
    #   self.net = new_cap >= course_hcap ? self.score - 2 : self.score - 1
    # end
  end

end
