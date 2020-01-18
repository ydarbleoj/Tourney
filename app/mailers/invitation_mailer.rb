# frozen_string_literal: true

require "sendgrid-ruby"

class InvitationMailer < ApplicationMailer
  include SendGrid

  def invite(invitation)
    @invitation = invitation
    mail(
        to: invitation.email,
        subject: "Tourney At Bandon! You're invited",
      )
  end
end