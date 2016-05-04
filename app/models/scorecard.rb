class Scorecard < ActiveRecord::Base
  belongs_to :new_course
  has_many :user_scores
  has_many :users, through: :user_scores

end
