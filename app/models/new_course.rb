class NewCourse < ApplicationRecord
  has_many :holes, dependent: :delete_all
  has_many :scorecards

  has_many :user_course_aggs
  has_many :user_hole_aggs
  has_many :tournament_round_aggs

  has_many :team_scorecards

  has_many :tournament_rounds
  has_many :tournaments, through: :tournament_rounds

  validates :name, presence: true, uniqueness: true
  validates :par, presence: true
  validates :slope, presence: true
  validates :rating, presence: true
  validates :tee, presence: true


end
