class TournamentRound < ApplicationRecord
  belongs_to :tournament, touch: true
  belongs_to :new_course

  has_many :users, through: :scorecards

  has_many :scorecards, dependent: :destroy
  has_many :user_scores, through: :scorecards

  has_many :team_scorecards, dependent: :destroy
  has_many :team_scores, through: :team_scorecards
  has_many :round_tee_times, dependent: :destroy

  accepts_nested_attributes_for :scorecards

  validates :round_number, presence: true
  validates :tournament_id, presence: true
  validates :round_date, presence: true
  validates :new_course_id, presence: true
end

