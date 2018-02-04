class PasswordResetsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:password_reset][:email].downcase)
    if @user
      @user.create_reset_digest
      @user.send_password_reset_email

      render json: 'Email has been sent'
    else
      render json: 'Email address not found.'
    end
  end

  def edit
  end
end
