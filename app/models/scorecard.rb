class Scorecard < ActiveRecord::Base
  belongs_to :new_course
  belongs_to :user
  belongs_to :tournament_round

  has_many :user_scores, dependent: :destroy

  accepts_nested_attributes_for :user_scores

  before_create :set_handicap

  def set_handicap
    self.handicap = self.user.handicap
  end

  def create_user_scores

  end

end
