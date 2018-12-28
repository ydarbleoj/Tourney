class UserScoreSerializer
  include FastJsonapi::ObjectSerializer
  set_type :user_score
  set_id :id

  belongs_to :scorecard

  attributes :score, :net, :par, :handicap, :putts, :number, :net_skin
end