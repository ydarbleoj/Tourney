class UserCourseAgg < ApplicationRecord
  belongs_to :user
  belongs_to :new_course

  has_one :user_agg, through: :user
  has_one :easiest_hole, class_name: 'UserHoleAgg', primary_key: :easiest_hole_id, foreign_key: :id
  has_one :hardest_hole, class_name: 'UserHoleAgg', primary_key: :hardest_hole_id, foreign_key: :id
  has_one :lowest_round, class_name: 'Scorecard', primary_key: :lowest_round_id, foreign_key: :id

  has_many :holes, through: :new_course
  has_many :tournament_rounds, through: :new_course
  has_many :user_hole_aggs
  has_many :scorecards, through: :user
  # has_many :user_scores, through: :scorecards


  def self.overall(course_id)
    where(new_course_id: course_id).first
  end

  def get_lowest_round
    id = self.new_course_id
    scorecards.lowest_round(id)
  end

  def hole_par_avgs
    user_hole_aggs
    .group(:par).average(:net_avg)
  end

  def hole_difficulty
    user_hole_aggs.joins(:hole)
    .select('user_hole_aggs.id AS agg_id, (net_avg::decimal - user_hole_aggs.par) AS hole_diff')
    .order('hole_diff DESC')
  end

  def calc_hcap_diff
    id = self.new_course_id
    scorecards.user_course_hcap_diff(id)
  end
end
