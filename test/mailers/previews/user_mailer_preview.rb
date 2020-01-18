# frozen_string_literal: true

class UserMailerPreview < ActionMailer::Preview
  def reset_password
    UserMailer.with(user: User.first).reset_password
  end
end