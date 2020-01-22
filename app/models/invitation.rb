class Invitation < ApplicationRecord
  scope :pending, -> { where(accepted: false) }
  belongs_to :tournament

  before_create :generate_token

  validates :email, presence: true
  def to_param
    token
  end

  def accepted?
    accepted
  end

  private
  def generate_token
    self.token = SecureRandom.hex(16)
  end
end
