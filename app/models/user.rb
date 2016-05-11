class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable,
         :validatable
  before_save { self.email = email.downcase }
  attachment :profile_image

  has_many :rounds
  has_many :courses, through: :rounds
  has_many :tournaments, through: :rounds
  has_many :leaderboards
  has_many :scorecards
  has_many :tournaments, through: :scorecards
  has_many :user_scores, through: :scorecards


  validates :username, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
end
