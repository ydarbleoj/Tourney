class UsersController < ApplicationController

  def index
    @users = User.all
    @user = current_user
    @rounds = Round.where(user_id: @user)
  end

  def new
    @user = User.new
  end

  def show
    @user = current_user
    @tournament = current_user.tournaments.where.not(end_date: nil).first

    unless @user == current_user
      redirect_to root_path, :alert => "Access Denied"
    end
    fewest_putts
    lowest_net
    next_round
  end

  def edit
    @user = current_user
    'USER EDIT'
  end

  def update
    @user = current_user
    "USER UPDATE"
    if @user.update(user_params)
      redirect_to @user
    else
      render "edit"
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to root_path
  end

  def fewest_putts
    @low_putt = @user.rounds.where.not(putts: nil).order(putts: :asc).limit(1).first
    @putt_course = Course.find(@low_putt.course_id)
  end

  def lowest_net
    @low_net = @user.rounds.where.not(score: nil).order('score - handicap ASC').limit(1).first
    @course = Course.find(@low_net.course_id)
  end

  def next_round
    @next_round = @user.rounds.where("tee_time < ?", Time.now).first
  end
  private

  def user_params
    params.require(:user).permit(:handicap, :username, :email, :password, :password_confirmation, :home)
  end
end
