class NewCoursesController < ApplicationController
  before_action :authenticate_user
  before_action :set_tournament

  def index
    p "params #{params}"
    p @new_courses = Tournament.find(params[:tournament_id]).new_courses.includes(:holes)
    render json: @new_courses
  end

  def show
    payload = []
    # scorecard = @tournament.tournament_rounds
    #   .where(new_course_id: params[:id]).first
    #   .scorecards.where(user_id: current_user.id)
    #   .select('scorecards.id AS id, scorecards.handicap AS handicap,
    #     scorecards.total_score AS total_score, scorecards.total_putts AS total_putts,
    #     scorecards.total_3putts AS total_3putts, scorecards.total_net AS total_net')

    course = @tournament.new_courses.find(params[:id])
    p payload = course
    render json: payload
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
    @tournament = Tournament.find(params['tournament_id'])
  end
  def find_model
    @model = NewCourses.find(params[:id]) if params[:id]
  end
end