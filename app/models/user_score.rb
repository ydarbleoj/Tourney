class UserScore < ApplicationRecord
  belongs_to :scorecard, touch: true
  has_one :user, through: :scorecard
  has_one :tournament_round, through: :scorecard

  validates :scorecard_id, presence: true
  validates :number, presence: true
  validates :score, presence: true
  validates :putts, presence: true

  before_save :calculate_net
  # after_save :set_net_skins
  # after_save :update_scorecard
  # after_save :update_team_score

  def update_team_score
    sc    = self.scorecard
    tr_id = sc.tournament_round_id

    group = TeeTime.grab_group(tr_id, sc.user_id)
    ids   = TeeTime.group_ids(group, tr_id)

    if Scorecard.check_scores(tr_id, ids, self.number) == ids.size
      score = Scorecard.add_team_score(tr_id, ids, self.number)
    end
    return if score.blank?

    if TeamScorecard.where(tournament_round_id: tr_id, group: group).exists?
      team_sc = TeamScorecard.where(tournament_round_id: tr_id, group: group).first
    else
      team_sc = TeamScorecard.create(new_course_id: sc.new_course_id, tournament_round_id: tr_id, group: group)
    end

    if team_sc.team_scores.where(number: self.number).exists?
      team_sc.team_scores.where(number: self.number).update(net: score)
    else
      team_sc.team_scores.create!(number: self.number, net: score, par: self.par)
    end
  end

  def update_scorecard
    scorecard = Scorecard.find(self.scorecard_id)
    if self.number == 18
      scorecard.update_column(:finished, true)
    end
    scores = scorecard.user_scores.select('SUM(score) AS total_score,SUM(net) AS total_net, SUM(putts) AS total_putts, SUM(CASE WHEN putts > 2 THEN 1 ELSE 0 END) AS total_3putts')[0].as_json

    scorecard.update(scores.except!('id'))
  rescue StandardError => e
    p e.inspect
  end

  def calculate_net
    return if score.blank?
    scorecard  = Scorecard.find(scorecard_id)
    handicap   = scorecard.handicap
    hole_hcap  = scorecard.holes.find_by_number(number).handicap

    if handicap < 19
      self.net = handicap >= hole_hcap ? score - 1 : score
    else
      new_cap = handicap - 18
      self.net = new_cap >= hole_hcap ? score - 2 : score - 1
    end
  end

  def current_skin(number, type)
    type = type == 'skin' ? :skin : :net_skin
    where(number: number)
    .where("#{type} = true OR MIN(net)")
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
    net_skin = self.user_scores.where(net_skin: true).count
    Scorecard.transaction do
      self.update_columns(net_skin_total: net_skin)
    end
  end
end
