class RoundAgg < ApplicationRecord
  belongs_to :tournament
  belongs_to :new_course

  has_many :scorecards, through: :new_course
  has_many :user_scores, through: :scorecards
end
