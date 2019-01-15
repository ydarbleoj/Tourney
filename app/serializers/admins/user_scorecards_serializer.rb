module Admins
  class UserScorecardsSerializer
    include FastJsonapi::ObjectSerializer
    set_type :leaderboard
    set_id :id

    belongs_to :user, serializer: UserSerializer
    belongs_to :tournament, serializer: TournamentSerializer
    has_many :scorecards, serializer: Admins::ScorecardsWithHolesSerializer
    has_many :user_scores, through: :scorecards, serializer: UserScoreSerializer

  end
end