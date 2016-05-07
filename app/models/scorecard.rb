class Scorecard < ActiveRecord::Base
  belongs_to :new_course
  belongs_to :user
  belongs_to :tournament_round

  has_many :user_scores



end
