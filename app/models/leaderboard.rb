class Leaderboard < ApplicationRecord
  attr_accessor :position, :rnd1_gnr, :rnd2_gnr, :rnd3_gnr, :total_skins
	belongs_to :tournament
	belongs_to :user

  has_one :skins_money

  has_many :tournament_rounds, through: :tournament
  has_many :scorecards, dependent: :delete_all
  has_many :user_scores, through: :scorecards, dependent: :delete_all

  def self.scorecard_totals(id)
    includes(scorecards: [{ user_scores: :hole }, :new_course]).find(id)
  end

  def self.admin_user_scorecards(id)
    includes(scorecards: [{new_course: :holes}, :user_scores]).find(id)
  end

  def current_total_score
    scorecards.adding_total_score
  end

  def self.strokes(tournament_id)
    includes({ scorecards: :user_scores }, :user)
    .where(tournament_id: tournament_id)
    .order('leaderboards.total_score asc')
  end

  def self.putting(tournament_id)
    includes(:scorecards, :user)
    .where(tournament_id: tournament_id)
    .order('leaderboards.total_putts asc')
  end

  def self.skins(tournament_id)
    includes({ scorecards: :user_scores }, :user, :skins_money)
    .where(tournament_id: tournament_id)
  end

  def self.admin_users(tournament_id)
    includes(:user)
    .where(tournament_id: tournament_id)
  end

  def self.putting_money
    joins(:user)
    .order('leaderboards.total_putts asc')
    .select("users.id AS user_id, leaderboards.total_3_putts, leaderboards.total_putts")
    .map do |lb|
      {
        user_id: lb.user_id,
        total_3_putts: lb.total_3_putts,
        total_putts: lb.total_putts,
      }
    end
  end

  def self.stroke_money
    joins(:user)
    .order('leaderboards.total_score asc')
    .select("users.id AS user_id, (users.first_name || ' ' || substring(users.last_name from 1 for 1)) AS username, leaderboards.handicap,
      leaderboards.rnd1_score, leaderboards.rnd2_score, leaderboards.rnd3_score, leaderboards.net_total, leaderboards.total_score")
    .map do |lb|
      {
        user_id: lb.user_id,
        scores: [lb.rnd1_score, lb.rnd2_score, lb.rnd3_score].sort,
        net_total: lb.net_total,
        total_score: lb.total_score
      }
    end
  end
end
