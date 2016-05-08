class UserScore < ActiveRecord::Base
  belongs_to :scorecard

  validates :scorecard_id, presence: true

  before_save :calculate_net
  before_save :total_score
  before_create :set_handicap

  def set_handicap
    self.handicap = self.scorecard.handicap
  end

  def calculate_net
    p scorecard
    p 'here'
    course_par = self.scorecard.new_course.holes[self.number - 1].par
    course_hcap = self.scorecard.new_course.holes[self.number - 1].handicap
    self.net = self.handicap > course_hcap ? self.score - 1 : self.score
  end

  def total_score
    p scorecard.user_scores.sum(:net)

  end


end
