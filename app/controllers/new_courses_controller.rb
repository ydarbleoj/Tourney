class NewCoursesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_tournament

  def index
    p @new_courses = @tournament.tournament_rounds
      .joins(:new_course)
      .order(round_number: :asc)
      .select('new_courses.id, new_courses.name')
  end

  def show
    @course = NewCourse.find(params[:id])
    @round_num = TournamentRound.where(tournament_id: @tournament.id, new_course_id: @course.id).pluck(:id)

    return if @course.blank?

    lowest_round
    scoring_avg
    putting_avg
    fewest_putts
    par_three_avg
    par_four_avg
    par_five_avg
  end

  def lowest_round
    @lowest_round = Scorecard.where(tournament_round_id: @round_num, new_course_id: @course.id).finished
      .order(total_net: :asc).first
  end

  def scoring_avg
    @net_scoring_avg = Scorecard.where(new_course_id: @course.id,
      tournament_round_id: @round_num).finished.average(:total_net)
  end

  def fewest_putts
    @fewest_putts = Scorecard.where(new_course_id: @course.id,
      tournament_round_id: @round_num).finished
      .order(total_putts: :asc).first
  end

  def putting_avg
    @putting_avg = Scorecard.where(new_course_id: @course.id,
      tournament_round_id: @round_num).finished.average(:total_putts)
    @three_putt_avg = Scorecard.where(new_course_id: @course.id,
      tournament_round_id: @round_num).finished.average(:total_3putts)
  end

  def par_three_avg
   p @par3_avg = Scorecard.where(new_course_id: @course.id,
      tournament_round_id: @round_num).finished
      .joins(:user_scores)
      .where('user_scores.par = ?', 3).average(:net)
  end

  def par_four_avg
    @par4_avg = Scorecard.where(new_course_id: @course.id,
      tournament_round_id: @round_num).finished
      .joins(:user_scores)
      .where('user_scores.par = ?', 4).average(:net)
  end

  def par_five_avg
    @par5_avg = Scorecard.where(new_course_id: @course.id,
      tournament_round_id: @round_num).finished
      .joins(:user_scores)
      .where('user_scores.par = ?', 5).average(:net)
  end

  private
  def set_tournament
    @tournament = Tournament.find(params[:tournament_id])
  end
  def find_model
    @model = NewCourses.find(params[:id]) if params[:id]
  end
end