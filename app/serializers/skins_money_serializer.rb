class SkinsMoneySerializer
  include FastJsonapi::ObjectSerializer
  set_type :skins_money
  set_id :id

  belongs_to :user
  belongs_to :tournament
  belongs_to :leaderboard


  attributes :user_id, :tournament_id, :round_one, :round_two, :round_three, :total, :leaderboard_id
end