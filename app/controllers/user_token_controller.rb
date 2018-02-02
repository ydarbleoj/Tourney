class UserTokenController < Knock::AuthTokenController

  def entity_name
    p 'token'
    'User'
  end

end
