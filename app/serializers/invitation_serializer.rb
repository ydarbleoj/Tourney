class InvitationSerializer
  include FastJsonapi::ObjectSerializer
  set_type :invitation
  set_id :id

  attributes :email, :first_name, :last_name, :accepted

  attribute :pending do |object|
    !object.accepted
  end

end