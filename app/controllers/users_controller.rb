class UsersController < ApplicationController
  before_action :authenticate_user

  def index
    p 'current_user'
    p current_user
    render json: UserSerializer.new(current_user).serialized_json
  end

  def new
    @user = User.new
  end

  def show
    p @user = current_user
    render json: @user
    # unless @user == current_user
    #   redirect_to root_path, :alert => "Access Denied"
    # end
  end

  def edit
    @user = current_user
    "edit"
  end

  def update
    p "update"
    @user = current_user
    @user.update(user_params)

    render json: @user
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to root_path
  end

  def fewest_putts
    @low_putt = @user.rounds.where.not(putts: nil).order(putts: :asc).limit(1).first
    @low_putt.nil?.! ? @putt_course = Course.find(@low_putt.course_id) : nil
  end

  def lowest_net
    @low_net = @user.rounds.where.not(score: nil).order('score - handicap ASC').limit(1).first
    @low_net.nil?.! ? @course = Course.find(@low_net.course_id) : nil
  end

  def avg_score
    @avg_score = @user.rounds.where.not(score: nil).average('score - handicap')
  end
  private

  def user_params
    params.require(:user).permit(:handicap, :first_name, :last_name, :username, :email, :gender, :password, :password_confirmation, :home, :profile_image)
  end

  def needs_password?(user, params)
    params[:password_confirmation].present?
  end
end
