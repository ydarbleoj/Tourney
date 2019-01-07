module Admins
  class AwaitingSerializer
    include FastJsonapi::ObjectSerializer
    set_type :user
    set_id :id

    attributes :first_name, :last_name

    attribute :tee_time_id do |object|
      nil
    end
  end
end