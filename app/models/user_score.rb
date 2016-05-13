class UserScore < ActiveRecord::Base
  belongs_to :scorecard


  validates :scorecard_id, presence: true

  before_save :set_handicap
  before_save :calculate_net
  # before_save :set_skin

  def set_handicap
    self.handicap = self.scorecard.handicap
  end

  def calculate_net
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

  def set_skin
    lowest_skin = scorecard.tournament_round.user_scores.where(number: self.number).order(net: :asc).pluck(:id, :net)
    lowest_skin = lowest_skin.group_by { |x| x[1] }.map { |x| x[1] }
    p lowest_skin[0][0]
    p self.id
    skin_value = lowest_skin[0].length == 1 && self.id == lowest_skin[0][0][0] ? true : false
    p skin_value
    if skin_value == true
      self.skin = true
    end
  end


end
