# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :user_name => 'JoelEdward',
  :password => 'Gonzaga2004//noble',#'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',
  :domain => 'tourney-app.com',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}

ActionMailer::Base.raise_delivery_errors = true
