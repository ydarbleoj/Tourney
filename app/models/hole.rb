class Hole < ApplicationRecord
  belongs_to :new_course
  has_many :scorecards, through: :new_course
  has_many :user_scores

  has_many :user_hole_aggs
end
