class Leaderboard < ApplicationRecord
	belongs_to :tournament
	belongs_to :user
	has_many :rounds, through: :tournaments
	# has_many :users, through: :tournaments


  def self.stroke_top_five
    joins(:user)
    .order('leaderboards.total_score asc')
    .select('users.id AS user_id, users.username AS username, leaderboards.handicap, leaderboards.net_total, leaderboards.total_score').first(5)
    .map do |lb|
      {
        user_id: lb.user_id,
        username: lb.username,
        handicap: lb.handicap,
        net_total: lb.net_total,
        total_score: lb.total_score
      }
    end
  end

  def self.stroke
    joins(:user)
    .order('leaderboards.total_score asc')
    .select('users.id AS user_id, users.username AS username, leaderboards.handicap,
      leaderboards.rnd1_score, leaderboards.rnd2_score, leaderboards.rnd3_score, leaderboards.net_total, leaderboards.total_score')
    .map do |lb|
      {
        user_id: lb.user_id,
        username: lb.username,
        handicap: lb.handicap,
        rnd1_score: lb.rnd1_score,
        rnd2_score: lb.rnd2_score,
        rnd3_score: lb.rnd3_score,
        net_total: lb.net_total,
        total_score: lb.total_score
      }
    end
  end

  def self.user_preview_stroke(tournament_id)
    joins(:user)
    .where(tournament_id: tournament_id)
    .select('users.id AS user_id, users.username AS username, leaderboards.handicap, leaderboards.net_total, leaderboards.total_score')
    .map do |lb|
      {
        user_id: lb.user_id,
        username: lb.username,
        handicap: lb.handicap,
        net_total: lb.net_total,
        total_score: lb.total_score
      }
    end.first
  end

  def self.putting
    joins(:user)
    .order('leaderboards.total_putts asc')
    .select('users.id AS user_id, users.username AS username, leaderboards.rnd1_putts, leaderboards.rnd2_putts, leaderboards.rnd3_putts, leaderboards.total_3_putts, leaderboards.total_putts')
    .map do |lb|
      {
        user_id: lb.user_id,
        username: lb.username,
        rnd1_putts: lb.rnd1_putts,
        rnd2_putts: lb.rnd2_putts,
        rnd3_putts: lb.rnd3_putts,
        total_3_putts: lb.total_3_putts,
        total_putts: lb.total_putts
      }
    end
  end

  def self.putting_top_five
    joins(:user)
    .order('leaderboards.total_putts asc')
    .select('users.id AS user_id, users.username AS username, leaderboards.total_3_putts, leaderboards.total_putts').first(5)
    .map do |lb|
      {
        user_id: lb.user_id,
        username: lb.username,
        total_3_putts: lb.total_3_putts,
        total_putts: lb.total_putts
      }
    end
  end


  def self.user_preview_putting(tournament_id)
    joins(:user)
    .where(tournament_id: tournament_id)
    .select('users.id AS user_id, users.username AS username, leaderboards.total_3_putts, leaderboards.total_putts')
    .map do |lb|
      {
        user_id: lb.user_id,
        username: lb.username,
        total_3_putts: lb.total_3_putts,
        total_putts: lb.total_putts
      }
    end.first
  end
end
