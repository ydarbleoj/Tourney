class TournamentRound < ActiveRecord::Base
  belongs_to :tournament


  has_many :scorecards
  has_many :new_courses, through: :scorecards
  has_many :user_scores, through: :scorecards
  has_many :users, through: :scorecards

  accepts_nested_attributes_for :scorecards
end
