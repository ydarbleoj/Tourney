class ApplicationController < ActionController::API
  include Knock::Authenticable
  # before_action :test_params


  def test_params
    p "APP CON"
    p params
    p current_user
  end
  private
end
