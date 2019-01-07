class TournamentRound < ApplicationRecord
  belongs_to :tournament, touch: true
  belongs_to :new_course

  has_many :leaderboard, through: :tournament
  has_many :users, through: :scorecards

  has_many :scorecards, dependent: :destroy
  has_many :user_scores, through: :scorecards

  has_many :team_scorecards, dependent: :destroy
  has_many :team_scores, through: :team_scorecards
  has_many :round_tee_times, dependent: :destroy
  has_many :tee_times

  has_many :round_aggs
  has_many :user_course_aggs, through: :new_course
  has_many :course_aggs, through: :new_course

  accepts_nested_attributes_for :scorecards

  validates :round_number, presence: true
  validates :tournament_id, presence: true
  validates :round_date, presence: true
  validates :new_course_id, presence: true

  def self.rounds
    includes(:new_course).order(round_number: :asc)
  end

  def self.course_data(tr_id)
    includes(:course_aggs, :round_aggs, :user_course_aggs).find(tr_id)
  end


end

