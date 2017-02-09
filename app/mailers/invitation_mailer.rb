class InvitationMailer < ApplicationMailer
  def invite(invitation)
    @invitation = invitation
    mail(
        to: invitation.email,
        subject: "Tourney At Bandon! You're invited",
      )
  end
end