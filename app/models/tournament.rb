class Tournament < ApplicationRecord
	# has_many :rounds
	# has_many :courses, through: :rounds

  has_many :tournament_users, dependent: :delete_all
  has_many :users, through: :tournament_users
  has_many :tournament_rounds, dependent: :destroy
  # has_many :tournament_new_courses, dependent: :delete_all
  has_many :new_courses, through: :tournament_rounds
  has_many :holes, through: :new_courses

  has_many :tournament_aggs

  has_many :stroke_moneys
  has_many :skins_moneys
  has_many :putting_moneys
  has_many :team_moneys

  has_many :round_tee_times, through: :tournament_rounds
  has_many :leaderboards
  has_many :tee_times, through: :tournament_rounds

  has_many :scorecards, through: :tournament_rounds
  has_many :team_scorecards, through: :tournament_rounds


  has_many :invitations
  has_one :tournament_leaderboard #nesc?

	# accepts_nested_attributes_for :rounds
  accepts_nested_attributes_for :scorecards

  validates :name, presence: true
  validates :year, presence: true
  validates :num_players, presence: true
  validates :num_rounds, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true



  def self.current_and_list(name)
    includes({ tournament_rounds: :new_course })
    .where(name: name)
    .order(id: :asc)
  end

  def self.invite_list(name)
    joins(:users).where(name: name)
    .select('users.id AS id, users.email AS user_email, users.username AS username').uniq.as_json
  end



end
