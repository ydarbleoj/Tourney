class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
	def check_for_user
    p current_user.first_name
    redirect_to root_path if current_user.nil?
  end

  def configure_permitted_parameters
     devise_parameter_sanitizer.sanitize(:sign_up) { |u| u.permit(:first_name, :last_name, :handicap, :email, :password, :password_confirmation)}
  end
end
