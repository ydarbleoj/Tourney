class NewCoursesController < ApplicationController
  before_action :authenticate_user
  before_action :set_tournament

  def index
    @new_courses = Tournament.find(params[:tournament_id]).new_courses.includes(:holes)
    render json: @new_courses
  end

  def show
    payload = []
    user_group = @tournament.tee_times.where(tournament_round_id: params[:round], user_id: current_user.id).first.group

    tee_times = @tournament.tee_times.where(tournament_round_id: params[:round], group: user_group)
      .group_by { |x| [x[:group], x[:tee_time].strftime('%H:%M')] }
      .map { |x| [x[0], x[1].map { |x| { user: x.user.first_name + ' ' + x.user.last_name.first } }] }.flatten(1)

    course = @tournament.new_courses.find(params[:id])
    payload = [{course: course, tee_times: tee_times}]
    render json: payload
  end











  # dead...i think
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