class UserScore < ApplicationRecord
  belongs_to :scorecard, touch: true
  has_one :user, through: :scorecard
  has_one :tournament_round, through: :scorecard

  validates :scorecard_id, presence: true
  validates :number, presence: true
  validates :score, presence: true
  validates :putts, presence: true

  before_save :calculate_net

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

  def self.skins_for(number, type)
    score = type == 'net_skin' ? 'net' : 'score'
    where(number: number)
    .select("user_scores.id AS id, #{type} AS skin, #{score} AS score, scorecard_id, number, putts")
  end

end
