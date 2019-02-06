class PuttingMoney < ApplicationRecord
  belongs_to :user
  belongs_to :tournament


  def self.update_player_money(tournament)
    scores = tournament.leaderboards.putting_money
    players = set_position(scores)
    'puttin money'
    set_money(players, tournament)
  end

  def self.set_position(scores)
    Position.setter(scores, :total_putts)
    scores
  end

  def self.set_money(players, tournament)
    purse = players.inject(0) { |sum, hash| sum + hash[:total_3_putts] }
    first_player = players.first

    winner(first_player, tournament, purse)

    players.each do |x|
      pm = PuttingMoney.where(tournament_id: tournament.id, user_id: x.user_id).first_or_create
      pm.update(position: x.position, money: 0)
    end
  end

  def self.winner(player, tourn, purse)
    p 'winner'
    pm = PuttingMoney.where(tournament_id: tourn.id, user_id: player.id).first_or_create
    pm.update(position: player.position, money: purse)
  end
end
