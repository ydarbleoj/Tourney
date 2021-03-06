class CourseAgg < ApplicationRecord
  belongs_to :new_course

  has_many :tournament_rounds, through: :new_course
  has_many :scorecards, through: :new_course

  has_one :easiest_hole, class_name: 'HoleAgg', primary_key: :easiest_hole_id, foreign_key: :id
  has_one :hardest_hole, class_name: 'HoleAgg', primary_key: :hardest_hole_id, foreign_key: :id
  has_one :lowest_round, class_name: 'Scorecard', primary_key: :lowest_round_id, foreign_key: :id

  has_many :hole_aggs
  has_many :holes, through: :new_course

  def hole_par_avgs
    hole_aggs
    .group(:par).average(:net_avg)
  end

  def hole_difficulty
    hole_aggs.joins(:hole)
    .select('hole_aggs.id AS agg_id, (net_avg::decimal - hole_aggs.par) AS hole_diff')
    .order('hole_diff DESC')
  end

  def get_lowest_round
    id = self.new_course_id
    scorecards.lowest_round(id)
  end

  def calc_hcap_diff
    scorecards.course_hcap_diff
  end

end
