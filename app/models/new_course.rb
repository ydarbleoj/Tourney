class NewCourse < ApplicationRecord
  # scope :current_par, -> (id, number) { joins(:holes).where(id: id, holes: { number: (1..number).to_a }).sum('holes.par') }
  has_many :holes, dependent: :delete_all
  has_many :scorecards

  has_many :team_scorecards

  has_many :tournament_new_courses
  has_many :tournaments, through: :tournament_new_courses
  has_many :tournament_rounds


  validates :name, presence: true, uniqueness: true
  validates :par, presence: true
  validates :slope, presence: true
  validates :rating, presence: true
  validates :tee, presence: true


  def current_par(played)
    holes.sort_by(&:number).select { |x| x if x.number <= played }
    .map { |x| x.par }.compact.inject(0, :+)
  end
end
