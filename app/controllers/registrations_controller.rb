# class RegistrationsController < ApplicationController
class RegistrationsController < Devise::RegistrationsController


	private

	def sign_up_params
    # devise_parameter_sanitizer.sanitize(:sign_up)
		params.require(:user).permit(:first_name, :last_name, :handicap, :gender, :email, :password, :password_confirmation)
	end

  def after_sign_up_path_for(resource)
    p "HERE"
    # Define Tournament
    @tournament = Tournament.where(name: 'Royal JBS Tournament').first
    @tournament_rounds = @tournament.tournament_rounds.first
    # Build user scorecard for Tournament
    @scorecard = @tournament_rounds.scorecards.create(user_id: resource.id, new_course_id: 1)
    (1..18).each { |x| @scorecard.user_scores.create(number: x) }

    tournaments_path
  end

  def after_inactive_sign_up_path_for(resource)
    root_path
  end

  def add_player_to_jbs
  end
end