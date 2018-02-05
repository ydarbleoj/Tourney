class UserScoresController < ApplicationController
  before_action :authenticate_user
  before_action :set_scorecard

  def index
    p "HERE HI"
    payload = course_data
    render json: payload
  end

  def show
    user_score = UserScore.find(params[:id])
    render json: user_score
  end

  def new
    @number = params[:number]
    @user_score = @scorecard.user_scores.new(user_scores_params)
    @course = @scorecard.new_course.holes.where(number: @user_score.number).first

    if @number == "18"
       eightteen = (1..17).to_a
       holes = @scorecard.user_scores.pluck(:number)
       @remaining_holes = eightteen - holes
    end
  end

  def create
    user_score = @scorecard.user_scores.create(score: params['user_score']['shots'], handicap: params['user_score']['handicap'],
      putts: params['user_score']['putts'], number: params['user_score']['number'], par: params['user_score']['par'])

    if user_score.save!
      if user_score.number == 18
        @scorecard.update_attribute(:finished, true)
      end

      scorecard = Scorecard.where(id: params[:scorecard_id]).course_info.first
      payload = [{sc: scorecard, us: course_data}]

      render json: payload
    else
      render json: 'failted to create'
    end
  end

  def edit
    @user_score = UserScore.find(params[:id])
  end

  def update
    user_score = UserScore.find(params[:id])
    user_score.update(score: params['params']['shots'], putts: params['params']['putts'])

    if user_score.save!
      scorecard = Scorecard.where(id: params[:scorecard_id]).course_info.first
      payload = [{sc: scorecard, us: course_data}]

      render json: payload
    else
      render json: "failed to update"
    end
  end

  private
  def set_scorecard
    @scorecard = Scorecard.find(params[:scorecard_id])
  end

  def course_data
    course = @scorecard.new_course.holes
    scores = @scorecard.user_scores

    grouped = group_data(course, scores)
  end

  def group_data(course, scores)
    [course, scores].flatten(1).group_by { |x| x.number }
      .map { |x| map_course_data(x[1]) }
  end

  def map_course_data(group)
    {
      number: group[0].number,
      par: group[0].par,
      handicap: group[0].handicap,
      yards: group[0].yards,
      user_score_id: group[1].blank? ? nil : group[1].id,
      score: group[1].blank? ? nil : group[1].score,
      putts: group[1].blank? ? nil : group[1].putts,
      net: group[1].blank? ? nil : group[1].net,
    }
  end

  def user_scores_params
    params.permit(:user_score, :scorecard_id, :par, :handicap, :score, :putts, :number, :net)
  end
end