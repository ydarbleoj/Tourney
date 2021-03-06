class User < ApplicationRecord
  attr_accessor :remember_token, :activation_token, :reset_token
  has_secure_password
  before_save { self.email = email.downcase }
  before_create :set_username

  has_many :rounds
  has_many :courses, through: :rounds
  has_many :tournament_users
  has_many :tournaments, through: :tournament_users
  has_many :leaderboards
  has_many :scorecards
  has_many :user_scores, through: :scorecards
  has_many :tournament_rounds, through: :scorecards
  has_many :tee_times

  has_many :stroke_moneys
  has_many :skins_moneys
  has_many :putting_moneys
  has_many :team_moneys

  has_one :user_agg
  has_many :user_hole_aggs
  has_many :user_course_aggs

  validates :first_name, presence: true
  validates :last_name, presence: true
  # validates :handicap, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  def to_token_payload
    {
      sub: id,
      email: email,
      username: username
    }
  end

  def set_username
    self.username = self.first_name + ' ' + self.last_name
  end

  def create_reset_digest
    self
  end

  def generate_password_token!
    begin
      self.reset_password_token = SecureRandom.urlsafe_base64
    end while User.exists?(reset_password_token: self.reset_password_token)
    self.reset_password_token_expires_at = 1.day.from_now
    save!
  end

  def clear_password_token!
    self.reset_password_token = nil
    self.reset_password_token_expires_at = nil
    save!
  end
end
