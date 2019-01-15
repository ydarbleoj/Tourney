class InviteListSerializer
  include FastJsonapi::ObjectSerializer
  set_type :user
  set_id :id


  attribute :user_id do |object|
    object.user_id
  end

  attribute :user_email do |object|
    object.user_email
  end
end