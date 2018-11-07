class UserHoleAgg < ApplicationRecord
  belongs_to :hole
  belongs_to :user_course_agg

  has_one :user, through: :user_course_agg
  has_many :scorecards, through: :user
  has_many :user_scores, through: :scorecards


  def averages_for(hole_id)
    scorecards.joins(:user_scores)
    .where(user_scores: { hole_id: hole_id })
    .select("AVG(user_scores.net) AS net_avg,
      AVG(user_scores.score) AS gross_avg,
      COUNT(user_scores.id) AS count,
      AVG(user_scores.putts) AS putts_avg,
      AVG(CASE WHEN user_scores.putts > 2 THEN 1 ELSE 0 END) AS three_putts_avg,
      AVG(CASE WHEN user_scores.score = #{self.par}
        AND user_scores.putts > 1 THEN 1 ELSE 0 END) AS greens_in_reg")
  end

end
