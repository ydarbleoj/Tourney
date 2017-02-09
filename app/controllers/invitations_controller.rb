class InvitationsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:accept, :accepted], raise: false
  before_action :current_tournament

  def index
    @invited = @tournament.invitations

    @accpeted = @tournament.invitations.where(accepted: true)

  end

  def new
    @invitation = Invitation.new

  end

  def create
    @invitation = current_tournament.invitations.new(invitation_params)
    @invitation.save

    InvitationMailer.invite(@invitation).deliver_now
    flash[:notice] = "#{@invitation.email} has been sent"
    redirect_to tournament_invitations_path(@tournament.id)
  end

  def accept
    store_location_for(:user, request.fullpath)
    @invitation = Invitation.find_by!(token: params[:id])
  end

  def accepted
    @invitation = Invitation.find_by!(token: params[:id])

    if user_signed_in?
      user = current_user
    else
      user_params = params[:user].permit(
        :first_name,
        :last_name,
        :email,
        :password,
        :password_confirmation
      )

      user = User.create!(user_params)
      @invitation.update(accepted: true)
      @tournament.leaderboards.create(user_id: user.id)
      TournamentUser.create(tournament_id: @invitation.tournament_id, user_id: user.id, role: @invitation.role)

      sign_in(user)
    end


    flash[:notice] = "You now have access to #{@tournament.name} : #{@tournament.year}"
    redirect_to user_path
  end

  private
  def current_tournament
    @tournament = Tournament.find(params[:tournament_id])
  end

  def invitation_params
    params.require(:invitation).permit(:email, :first_name, :last_name, :role, :token, :accepted)
  end
end