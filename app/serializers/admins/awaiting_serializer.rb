module Admins
  class AwaitingSerializer
    include FastJsonapi::ObjectSerializer
    set_type :scorecard
    set_id :id

    belongs_to :user

    attributes :handicap, :user_id

    attributes :first_name do |obj|
      obj.user.first_name
    end

    attributes :last_name do |obj|
      obj.user.last_name
    end

  end
end
