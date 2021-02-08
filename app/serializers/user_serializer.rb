class UserSerializer
  include FastJsonapi::ObjectSerializer
  set_type :user
  set_id :id

  attributes :email, :first_name, :last_name, :home

  attribute :role do |object|
    object.admin ? 'admin' : 'member'
  end

  attribute :username do |object|
    object.username
  end

  attribute :id do |object|
    object.id
  end
end