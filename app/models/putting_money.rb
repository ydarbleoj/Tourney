class PuttingMoney < ApplicationRecord
  belongs_to :user
  belongs_to :tournament


  def self.update_player_money(tournament)
    scores = tournament.leaderboards.putting_money
    players = set_position(scores)

    set_money(players, tournament)
  end

  def self.set_position(scores)
    new_payload = []
    payload = scores.group_by { |x| x[:total_putts] }.sort.map { |x| x[1] }
    pos = 0
    payload.each do |x|
      pos = pos == 0 ? 1 : pos

      if pos == 1 && x.length > 1
        new_payload << x.sort_by { |x| x[:total_3_putts] }
          .map { |x| x.merge({pos: pos}) }
      else
        new_payload << x.map { |x| x.merge({pos: pos}) }
      end

      pos += x.length
    end
    new_payload.flatten(1)
  end

  def self.set_money(players, tournament)
    purse = players.inject(0) { |sum, hash| sum + hash[:total_3_putts] }
    first_player = players.shift

    tournament.putting_moneys.create(user_id: first_player[:user_id], position: first_player[:pos], money: purse)

    players.each do |x|
      tournament.putting_moneys.create(user_id: x[:user_id], position: x[:pos])
    end
  end
end
