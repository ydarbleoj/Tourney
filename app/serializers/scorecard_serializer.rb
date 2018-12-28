class ScorecardSerializer
  include FastJsonapi::ObjectSerializer
    set_type :scorecard
    set_id :id

    belongs_to :user
    # belongs_to :new_course
    belongs_to :leaderboard

    has_many :user_scores, serializer: UserScoreSerializer

    attributes :id, :handicap, :net_skin_total, :user_id, :round_num, :total_3putts, :total_score

    attribute :holes_won do |object|
      object.user_scores.map {|x| x.number if x.net_skin }.compact
    end

end