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

  def update_leaderboard

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
