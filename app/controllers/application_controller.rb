class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
private
	def check_for_user
    redirect_to root_path if current_user.nil?
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update) { |u|
      u.permit(:password, :password_confirmation)
    }
  end
end
