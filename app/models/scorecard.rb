class Scorecard < ApplicationRecord
  scope :finished, -> { where(finished: true) }
  belongs_to :new_course

  belongs_to :user
  belongs_to :tournament_round
  belongs_to :new_course

  has_many :user_scores, dependent: :destroy

  accepts_nested_attributes_for :user_scores

  before_save :set_handicap
  after_save :update_leaderboard
  # after_create :create_user_scores

  def set_handicap
    self.handicap = self.user.handicap
  end

  def self.skins_preview
    joins(:user_scores, :user)
    .where('user_scores.net_skin = ?', true)
    .group('users.id')
    .select('users.username AS username, COUNT(users.id) AS total')
    .map { |x| { username: x.username, total: x.total } }
    .sort_by { |x| x[:total] }.reverse.first(5)
  end

  def self.skins_total
    joins(:user_scores, :user)
    .where('user_scores.net_skin = ?', true)
    .group('users.id')
    .select('users.username AS username, COUNT(users.id) AS total')
    .map { |x| { username: x.username, total: x.total } }
    .sort_by { |x| x[:total] }.reverse
  end


  def update_skins
    p "SCORECARD SKINS"
   p skin = self.user_scores.where({skin: true}).count
   p  net_skin = self.user_scores.where({net_skin: true}).count

    Scorecard.transaction do
      sc.update_columns(gross_skin_total: skin, net_skin_total: net_skin)
    end
  end

end
