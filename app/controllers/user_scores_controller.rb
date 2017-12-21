class UserScoresController < ApplicationController
  before_action :authenticate_user
  before_action :set_tournament
  before_action :set_scorecard


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
    us = params[:user_score]
    @user_score = @scorecard.user_scores.create(score: us['score'], handicap: us['handicap'],
      putts: us['putts'], number: us['number'], par: us['par'])

    if @user_score.save
      if @user_score.number == 18
        @scorecard.update_attribute(:finished, true)
      end
      redirect_to tournament_scorecard_path(@tournament.id, @scorecard.id, anchor: @user_score.number)
    else
      'new'
    end
  end

  def edit
    @user_score = UserScore.find(params[:id])
    @course = @scorecard.new_course.holes.where(number: @user_score.number).first
  end

  def update
    p params
    us = params[:user_score]
    @user_score = UserScore.find(params[:id])

    @user_score.update_attributes(score: us['score'], putts: us['putts'], par: us[:par])
    if @user_score.save
      hole = @user_score.number
      anchor = hole
      redirect_to tournament_scorecard_path(@tournament.id, @scorecard.id, anchor: anchor)
    else
      flash[:notice] = 'Your edit did not save'
      redirect_to tournament_scorecard_path(@tournament.id, @scorecard.id)
    end
  end

  private
  def set_scorecard
    @scorecard = Scorecard.find(params[:scorecard_id])
  end

  def set_tournament
    @tournament = Tournament.find(params[:tournament_id])
  end

  def user_scores_params
    params.permit(:user_score, :scorecard_id, :par, :handicap, :score, :putts, :number, :net)
  end
end