# frozen_string_literal: true

class Tournament < ApplicationRecord
  has_many :tournament_users, dependent: :delete_all
  has_many :users, through: :tournament_users
  has_many :tournament_rounds, dependent: :destroy
  has_many :new_courses, through: :tournament_rounds
  has_many :holes, through: :new_courses

  has_many :tournament_aggs
  has_many :round_aggs, through: :tournament_rounds

  has_many :stroke_moneys
  has_many :skins_moneys
  has_many :putting_moneys
  has_many :team_moneys

  has_many :round_tee_times, through: :tournament_rounds
  has_many :leaderboards
  has_many :tee_times, through: :tournament_rounds

  has_many :scorecards, through: :tournament_rounds
  has_many :user_scores, through: :scorecards
  has_many :team_scorecards, through: :tournament_rounds

  has_many :invitations
  has_one :tournament_leaderboard #nesc?

  accepts_nested_attributes_for :scorecards

  validates :name, presence: true
  validates :year, presence: true
  validates :num_players, presence: true
  validates :num_rounds, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true

  def self.current_and_list(name)
    includes({ tournament_rounds: :new_course })
    .where(name: name)
    .order(id: :asc)
  end
end
