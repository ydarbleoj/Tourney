class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable,
         :validatable
  before_save { self.email = email.downcase }
  before_create :username

  has_many :rounds
  has_many :courses, through: :rounds
  has_many :tournament_users
  has_many :tournaments, through: :tournament_users
  has_many :leaderboards
  has_many :scorecards
  has_many :user_scores, through: :scorecards
  has_many :tournament_rounds, through: :scorecards


  validates :first_name, presence: true
  validates :last_name, presence: true
  # validates :handicap, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  # def to_param
  #   "#{self.username}"
  # end

  def username
    self.username = self.first_name + self.last_name
  end
end
