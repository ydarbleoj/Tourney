class RoundAgg < ApplicationRecord
  belongs_to :tournament_round

  has_one :new_course, through: :tournament_round
  has_one :course_agg, through: :new_course
  has_one :tournament, through: :tournament_round

  has_one :easiest_hole, class_name: 'Hole', primary_key: :easiest_hole_id, foreign_key: :id
  has_one :hardest_hole, class_name: 'Hole', primary_key: :hardest_hole_id, foreign_key: :id
  has_one :lowest_round, class_name: 'Scorecard', primary_key: :lowest_round_id, foreign_key: :id
  has_many :scorecards, through: :tournament_round
  has_many :user_scores, through: :scorecards

  def scorecard_avgs
    scorecards.completed.round_averages
  end

  def set_lowest_round
    scorecards.total_lowest_round
  end

  def hole_par_avgs
    user_scores
    .group(:par).average(:net)
  end

  def hole_difficulty
    user_scores.joins(:hole)
      .select('holes.id AS hole_id, (net::decimal - holes.par) AS hole_diff')
      .order('hole_diff DESC')
  end

  def calc_hcap_diff
    scorecards.course_hcap_diff
  end

  def hardest_hole_hcap_diff
    user_scores
      .joins(:hole)
      .where(user_scores: { hole_id: hardest_hole_id })
      .select('AVG(user_scores.net::decimal - holes.par) AS hole_diff')[0].as_json['hole_diff'].to_f
  end

  def easiest_hole_hcap_diff
    user_scores
      .joins(:hole)
      .where(user_scores: { hole_id: easiest_hole_id })
      .select('AVG(user_scores.net::decimal - holes.par) AS hole_diff')[0].as_json['hole_diff'].to_f
  end

  def self.tournament_avgs
    select("
      AVG(par3_avg) AS par3_avg,
      AVG(par4_avg) AS par4_avg,
      AVG(par5_avg) AS par5_avg,
      AVG(net_avg) AS net_avg,
      AVG(gross_avg) AS gross_avg,
      AVG(putts_avg) AS putts_avg,
      AVG(three_putts_avg) AS three_putts_avg,
      AVG(hcap_diff) AS hcap_diff
    ")
  end
end
