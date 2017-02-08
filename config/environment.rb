# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :user_name => 'Joelbrady',
  :password => '20[Noble]04',
  :domain => 'tourney-app.com',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}

ActionMailer::Base.raise_delivery_errors = false
# SENDGRID_NAME=Joelbrady
# SENDGRID_PASSWORD=20[Noble]04