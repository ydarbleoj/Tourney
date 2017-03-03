# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!
ActionMailer::Base.delivery_method = :smtp
# ActionMailer::Base.smtp_settings = {

# }

ActionMailer::Base.raise_delivery_errors = true
