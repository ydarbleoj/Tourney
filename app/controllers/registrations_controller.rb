class RegistrationsController < ApplicationController
	before_filter :find_model



	private
	def sign_up_params
		params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
	end

	def after_sign_up_path_for(resource)
		"/newuser"
	end

	def after_inactive_sign_up_path_for(resource)
		root_path
	end
end