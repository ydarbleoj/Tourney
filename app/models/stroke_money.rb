class StrokeMoney < ApplicationRecord
  belongs_to :user
  belongs_to :tournament

  def self.update_player_money(tournament)
    @purse = tournament.num_players * 30

    scores = tournament.leaderboards.stroke_money
    players = set_position(scores)

    set_money(players, tournament)
  end

  def self.set_position(scores)
    new_payload = []
    payload = scores.group_by { |x| x[:total_score] }.sort.map { |x| x[1] }
    pos = 0

    payload.each do |x|
      pos = pos == 0 ? 1 : pos

      if x.length > 1
        new_payload << x.sort_by { |y| [y[:scores][0], y[:scores][1], y[:scores][2]] }
          .map.with_index { |z, i| z.merge({pos: pos, money: purse(pos, x.length, i)}) }
      else
        new_payload << x.map.with_index { |z, i| z.merge({ pos: pos, money: purse(pos, x.length, i)}) }
      end
      pos += x.length
    end
    new_payload.flatten(1)
  end

  def self.set_money(players, tournament)
    StrokeMoney.transaction do
      players.each do |x|
        if tournament.stroke_moneys.where(user_id: x[:user_id]).exists?
          tournament.stroke_moneys.where(user_id: x[:user_id]).update(money: x[:money], position: x[:pos])
        else
          tournament.stroke_moneys.create(user_id: x[:user_id], money: x[:money], position: x[:pos])
        end
      end
    end
  end

  def self.purse(pos, group_length, i)
    case pos
    when 1
      p 'first'
      if i == 0
        (@purse * 0.5625)
      else
        if group_length == 2
          (@purse * 0.25)
        else
          (@purse * 0.4375) / (group_length - 1)
        end
      end
    when 2
      p 'sec'
      if i == 0 && group_length == 1
        (@purse * 0.25)
      else
        (@purse * 0.4375) / group_length
      end
    when 3
      p 'third'
       (@purse * 0.1875) / group_length
    else
      0
    end
  end

end
