# frozen_string_literal: true

require "sendgrid-ruby"

class UserMailer < ApplicationMailer
  include SendGrid

  def reset_password(user)
    @user = user
    mail(to: @user.email, subject: 'Reset your password')
  end
end
