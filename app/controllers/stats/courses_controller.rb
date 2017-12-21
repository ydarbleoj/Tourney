class Stats::CoursesController < ApplicationController
  before_action :authenticate_user
  before_action :set_tournament

  def index
    user = {}
    round = {}
    payload = {}
    p "STATS"
    user = { user: map_user_stats }
    course = { course: map_course_stats }
    payload = user.merge(course)
    render json: payload
  end

  private
  def map_user_stats
    cs = user_course_stats[0]
    {
      lowest_round: user_lowest_round,
      course_avg: cs['avg'],
      fewest_putts: user_fewest_putts,
      avg_putts: cs['total_putts'],
      greens_in_reg: nil,
      par3_avg: user_par3_avg,
      par4_avg: user_par4_avg,
      par5_avg: user_par5_avg
    }
  end

  def map_course_stats
    cs = course_stats[0]
    {
      lowest_round: course_lowest_round,
      fewest_putts: course_fewest_putts,
      course_avg: cs['avg'].present? ? cs['avg'].round(1) : nil,
      avg_putts: cs['total_putts'],
      greens_in_reg: nil,
      par3_avg: course_par3_avg,
      par4_avg: course_par4_avg,
      par5_avg: course_par5_avg
    }
  end

  def user_lowest_round
    @course.scorecards.where(user_id: current_user.id).order(total_net: :asc)
      .pluck(:total_net).first
  end

  def user_fewest_putts
    @course.scorecards.where(user_id: current_user.id).order(total_net: :asc)
      .pluck(:total_putts).first
  end

  def user_course_stats
    @course.scorecards.where(user_id: current_user.id)
      .select('AVG(total_net) AS avg, AVG(total_putts) AS total_putts')
  end

  def user_par3_avg
    @course.scorecards.joins(:user_scores)
      .where('scorecards.user_id = ? AND user_scores.par = ?', current_user.id, 3)
      .average(:net).round(1)
  end

  def user_par4_avg
    @course.scorecards.joins(:user_scores)
      .where('scorecards.user_id = ? AND user_scores.par = ?', current_user.id, 4)
      .average(:net).round(1)
  end

  def user_par5_avg
    @course.scorecards.joins(:user_scores)
      .where('scorecards.user_id = ? AND user_scores.par = ?', current_user.id, 5)
      .average(:net).round(1)
  end

  def user_gir
  end

  def course_lowest_round
    x = @course.scorecards.joins(:user).order(total_net: :asc)
      .pluck('users.username, scorecards.total_net').first
    { username: x[0], total: x[1] }
  end

   def course_fewest_putts
    x = @course.scorecards.joins(:user).order(total_net: :asc)
      .pluck('users.username, scorecards.total_putts').first
    { username: x[0], total: x[1] }
  end

  def course_stats
    @course.scorecards.select('AVG(total_net) AS avg, AVG(total_putts) AS total_putts')
  end

  def course_par3_avg
    @course.scorecards.joins(:user_scores).where('user_scores.par = ?', 3).average(:net).round(1)
  end

  def course_par4_avg
    @course.scorecards.joins(:user_scores).where('user_scores.par = ?', 4).average(:net).round(1)
  end

  def course_par5_avg
    @course.scorecards.joins(:user_scores).where('user_scores.par = ?', 5).average(:net).round(1)
  end

  def set_tournament
    @tournament = Tournament.find(params[:tournament_id])
    @course     = NewCourse.find(params[:course_id])
  end
end