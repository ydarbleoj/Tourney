class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  # before_filter :configure_permitted_parameters, if: :devise_controller?

private
	def check_for_user
    redirect_to root_path if current_user.nil?
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update) { |u|
      u.permit(:password, :password_confirmation, :current_password)
    }
  end
end
