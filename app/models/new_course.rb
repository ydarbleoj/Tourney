class NewCourse < ActiveRecord::Base
  has_many :holes, dependent: :destroy
  has_many :scorecards

  has_many :tournament_new_courses
  has_many :tournaments, through: :tournament_new_courses
  has_many :tournament_rounds


  validates :name, presence: true
  validates :par, presence: true
  validates :slope, presence: true
  validates :rating, presence: true
  validates :tee, presence: true

end
