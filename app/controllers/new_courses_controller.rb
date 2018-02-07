class NewCoursesController < ApplicationController
  before_action :authenticate_user
  before_action :set_tournament

  def index
    @new_courses = Tournament.find(params[:tournament_id]).new_courses.includes(:holes)
    render json: @new_courses
  end

  def show
    payload = []

    p 'NEW COURSE'
    p user_group = @tournament.tee_times.where(tournament_round_id: params[:round], user_id: current_user.id).first

    if user_group.present?
      user_group = user_group.group
      tee_times = @tournament.tee_times.where(tournament_round_id: params[:round], group: user_group)
      tee_times = check_existence(tee_times)
    else
      tee_times = []
    end
    course = @tournament.new_courses.find(params[:id])

    payload = [{course: course, tee_times: tee_times}]
    render json: payload
  end


  private
  def set_tournament
    @tournament = Tournament.find(params['tournament_id'])
  end

  def check_existence(times)
    return [] if times.blank?
    p times
    times.group_by { |x| [x[:group], x[:tee_time].strftime('%H:%M')] }
      .map { |x| [x[0], x[1].map { |x| { user: x.user.first_name + ' ' + x.user.last_name.first } }] }.flatten(1)
  end

  def find_model
    @model = NewCourses.find(params[:id]) if params[:id]
  end
end