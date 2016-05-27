class UserScore < ActiveRecord::Base
  belongs_to :scorecard, touch: true


  validates :scorecard_id, presence: true

  before_save :set_handicap
  before_save :calculate_net

  def set_handicap
    self.handicap = self.scorecard.handicap
  end

  def calculate_net
    course_par = self.scorecard.new_course.holes[self.number - 1].par
    course_hcap = self.scorecard.new_course.holes[self.number - 1].handicap

    if self.score.nil?.!
      if self.handicap < 19
        self.net = self.handicap >= course_hcap ? self.score - 1 : self.score
      else
        new_cap = self.handicap - 18
        self.net = new_cap >= course_hcap ? self.score - 2 : self.score - 1
      end
    end
  end

end
