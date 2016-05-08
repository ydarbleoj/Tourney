class TournamentRound < ActiveRecord::Base
  belongs_to :tournament


  has_many :scorecards
  has_many :new_courses, through: :scorecards

  accepts_nested_attributes_for :scorecards
end
