class Scorecard < ActiveRecord::Base
  belongs_to :new_course
  belongs_to :user, touch: true
  belongs_to :tournament_round, touch: true

  has_many :user_scores, dependent: :destroy

  accepts_nested_attributes_for :user_scores

  before_save :set_handicap

  def set_handicap
    self.handicap = self.user.handicap
  end

end
