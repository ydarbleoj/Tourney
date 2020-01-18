class ApplicationController < ActionController::API
  include Knock::Authenticable

  rescue_from ResetPasswordError, with: :not_authorized

  def not_authorized
    render json: { error: 'Not authorized' }, status: :unauthorized
  end
end
