class UsersController < ApplicationController
  before_filter :check_for_user

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
    avg_score
  end

  def edit
    @user = current_user
    "edit"
  end

  def update
    @user = current_user

    if user_params[:password_confirmation].blank?
      user_params.delete(:password)
      user_params.delete(:password_confirmation)
    end

    update_success = if needs_password?(@user, user_params)
                       @user.update(user_params)
                     else
                       @user.update_without_password(user_params)
                     end

    if update_success
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

  def avg_score
    @avg_score = @user.rounds.where.not(score: nil).average('score - handicap')
  end
  private

  def user_params
    params.require(:user).permit(:handicap, :username, :email, :password, :password_confirmation, :home, :profile_image)
  end

  def needs_password?(user, params)
    params[:password].present?
  end
end
