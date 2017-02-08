class InvitationMailer < ApplicationMailer
  def invite(invitation)
    @invitation = invitation
    mail(
        to: invitation.email,
        subject: "You've been invited to this years Tourney At Bandon!",
      )
  end
end