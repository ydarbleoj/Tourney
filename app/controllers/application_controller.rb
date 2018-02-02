class ApplicationController < ActionController::API
  include Knock::Authenticable
  # before_action :authenticate


  def test_params
    p "APP CON"
    p params
  end
  private
end
