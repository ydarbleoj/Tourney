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
    unless @user == current_user 
      redirect_to :back, :alert => "Access Denied"
    end 

  end

  def edit
  end

  def update
  end

  def destroy
  end

  def calculate_handicap
    
  end
end
