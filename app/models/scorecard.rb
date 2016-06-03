class Scorecard < ActiveRecord::Base
  belongs_to :new_course
  belongs_to :user, touch: true
  belongs_to :tournament_round, touch: true

  has_many :user_scores, dependent: :destroy

  accepts_nested_attributes_for :user_scores

  before_save :set_handicap

  def set_handicap
    p self.handicap
    self.handicap = (self.user.handicap * self.new_course.slope) / 113
  end

end
