class InvitationSerializer
  include FastJsonapi::ObjectSerializer
  set_type :invitation
  set_id :id

  attributes :email, :first_name, :last_name, :accepted, :tournament_id, :id
  belongs_to :tournament, if: Proc.new { |record| record.tournament.present? }

  attribute :pending do |object|
    !object.accepted
  end

  attribute :tourn_name do |object|
    object.tournament.name if object.tournament.present?
  end

  attribute :tourn_year do |object|
    object.tournament.year if object.tournament.present?
  end

end