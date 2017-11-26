class UserScore < ApplicationRecord
  # attr_accessible :number

  belongs_to :scorecard, touch: true


  validates :scorecard_id, presence: true
  validates :number, presence: true
  validates :score, presence: true
  validates :putts, presence: true

  before_save :calculate_net
  # after_save :set_skins
  after_save :set_net_skins
  # after_save :update_skins

  # after_save :update_scorecard


  def update_scorecard
    scorecard = Scorecard.find(self.scorecard_id)


  end

  def calculate_net
    scorecard  = Scorecard.find(self.scorecard_id)
    tournament = scorecard.tournament_round.tournament
  p 'calculate_net'
    course_par = self.scorecard.new_course.holes[self.number - 1].par
    course_hcap = self.scorecard.new_course.holes[self.number - 1].handicap

    if self.score.nil?.!
      if self.handicap < 19
        self.net = self.handicap >= course_hcap ? self.score - 1 : self.score
      else
        new_cap = self.handicap - 18
        self.net = new_cap >= course_hcap ? self.score - 2 : self.score - 1
      end
    end
  end

  def set_skins
    p "USERSCORE HERE"
    return if self.score.nil?

    tr = self.scorecard.tournament_round
    current_skin = tr.user_scores.where(number: self.number).where(skin: true).pluck(:id, :score)
    current_low_score = current_skin.blank?.! ? current_skin[0][1] : []

    new_low_score = tr.user_scores.where(number: self.number).where.not(score: nil).minimum(:score)
    users_with_lowest_score = tr.user_scores.where(number: self.number).where.not(score: nil).where(score: new_low_score).pluck(:id, :score)

    if current_skin.blank?
      if current_skin.blank? && new_low_score > self.score
        self.update_columns(skin: true)
      end

      if current_skin.blank? && users_with_lowest_score.length > 1
        "NO WINNER #{users_with_lowest_score}"
      end

      if current_skin.blank? && users_with_lowest_score.length == 1 && (users_with_lowest_score[0][0] == self.id)
        self.update_columns(skin: true)
      end
    end

    if current_skin.blank?.!
      if users_with_lowest_score.length == 1
        if current_low_score == new_low_score
         "STAYS THE SAME #{current_skin}"
        elsif current_low_score > new_low_score
          new_skin = UserScore.find(users_with_lowest_score[0][0])
          new_skin.update_columns(skin: true)

          old_skin = UserScore.find(current_skin[0][0])
          old_skin.update_columns(skin: false)
        end
      end

      if users_with_lowest_score.length > 1
        if current_low_score == new_low_score || current_low_score > new_low_score
          remove_skin = UserScore.find(current_skin.flatten[0])
          remove_skin.update_columns(skin: false)
        end
      end
    end
  end

  def set_net_skins
    p "USERSCORE NET HERE"
    return if self.net.nil?

    tr = self.scorecard.tournament_round
    current_skin = tr.user_scores.where(number: self.number).where(net_skin: true).pluck(:id, :net)
    current_low_score = current_skin.blank?.! ? current_skin[0][1] : []

    new_low_score = tr.user_scores.where(number: self.number).where.not(net: nil).minimum(:net)
    users_with_lowest_score = tr.user_scores.where(number: self.number).where.not(net: nil).where(net: new_low_score).pluck(:id, :net)

    if current_skin.blank?
      if current_skin.blank? && new_low_score > self.net
        self.update_columns(net_skin: true)
      end

      if current_skin.blank? && users_with_lowest_score.length > 1
        "NO WINNER #{users_with_lowest_score}"
      end

      if current_skin.blank? && users_with_lowest_score.length == 1 && (users_with_lowest_score[0][0] == self.id)
        self.update_columns(net_skin: true)
      end
    end

    if current_skin.blank?.!
      if users_with_lowest_score.length == 1
        if current_low_score == new_low_score
        p "STAYS THE SAME #{current_skin}"
        elsif current_low_score > new_low_score
          new_skin = UserScore.find(users_with_lowest_score[0][0])
          new_skin.update_columns(net_skin: true)

          old_skin = UserScore.find(current_skin[0][0])
          old_skin.update_columns(net_skin: false)
        end
      end

      if users_with_lowest_score.length > 1
        if current_low_score == new_low_score || current_low_score > new_low_score
          remove_skin = UserScore.find(current_skin.flatten[0])
          remove_skin.update_columns(net_skin: false)
        end
      end
    end
  end

  def update_skins
    p "SCORECARD SKINS"
    sc = self.scorecard
   p skin = sc.user_scores.where({skin: true}).count
   p  net_skin = sc.user_scores.where({net_skin: true}).count

    Scorecard.transaction do
      sc.update_columns(gross_skin_total: skin, net_skin_total: net_skin)
    end
  end
end
