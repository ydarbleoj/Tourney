class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  before_filter :configure_permitted_parameters, if: :devise_controller?

  private

  def record_not_found
    redirect_to root_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update) { |u|
      u.permit(:password, :password_confirmation, :current_password)
    }
  end
end
