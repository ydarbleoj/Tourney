class Hole < ApplicationRecord
  belongs_to :new_course
  has_many :scorecards, through: :new_course
end
