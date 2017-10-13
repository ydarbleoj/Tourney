class Knock::AuthTokenSerializer < ActiveModel::Serializer
  def id
   p object.token
  end
end