# frozen_string_literal: true

class PasswordResetsController < ApplicationController
  before_action :set_user, only: [:edit, :update]
  KEYS = [:password, :password_confirmation].freeze
  def new
  end

  def create
    user = User.find_by(email: params[:password_reset][:email].downcase)
    if user
      user.generate_password_token!
      UserMailer.reset_password(user).deliver_now

      render json: 'Email has been sent'
    else
      render json: 'Email address not found.', status: 400
    end
  end

  def edit
    render json: :ok
  end

  def update
    if @user.update!(password_params)
      @user.clear_password_token!

      render json: { user: @user, password: password_params[:password]}, status: 200
    else
      render json: { error: 'Not authorized' }, status: :unauthorized
    end
  end

  private

  def set_user
    @user = User.find_by(reset_password_token: params[:token])

    raise ResetPasswordError unless @user&.reset_password_token_expires_at && @user.reset_password_token_expires_at > Time.now
  end

  def password_params
    params.tap { |p| p.require(KEYS) }.permit(*KEYS)
  end
end
