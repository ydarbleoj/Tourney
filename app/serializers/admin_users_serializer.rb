class AdminUsersSerializer
  include FastJsonapi::ObjectSerializer
  set_type :leaderboard
  set_id :id
  belongs_to :user

  attributes :handicap

  attribute :first_name do |object|
    object.user.first_name
  end

  attribute :last_name do |object|
    object.user.last_name
  end

  attribute :email do |object|
    object.user.email
  end

  attribute :role do |object|
    object.user.admin ? 'admin' : 'member'
  end

  attribute :pending do |object|
    false
  end

end