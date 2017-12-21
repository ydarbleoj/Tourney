class StrokeMoney < ApplicationRecord
  belongs_to :user
  belongs_to :tournament

  def self.update_player_money(tournament)
    p 'here'
    p leaderboard = tournament.leaderboards.stroke.first(3)



  end
end
