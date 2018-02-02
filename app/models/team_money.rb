class TeamMoney < ApplicationRecord
  belongs_to :user
  belongs_to :tournament

  after_commit :total_winnings

  def self.update_round(tourn_id, user_ids, round_number)
    players = Tournament.find(tourn_id).num_players
    money = (10 * players) / user_ids.size
    p 'money'
    p money
    case round_number
    when 1
      user_ids.each do |x|
        TeamMoney.where(tournament_id: tourn_id, user_id: x).update(round_one: money)
      end
    when 2
      p 'hi money'
      user_ids.each do |x|
       p TeamMoney.where(tournament_id: tourn_id, user_id: x).update(round_two: money)
      end
    when 3
      user_ids.each do |x|
        TeamMoney.where(tournament_id: tourn_id, user_id: x).update(round_three: money)
      end
    end
  end

  def self.remove_money(tourn_id, user_ids, round_number)
    case round_number
    when 1
      user_ids.each do |x|
        TeamMoney.where(tournament_id: tourn_id, user_id: x).update(round_one: 0)
      end
    when 2
      user_ids.each do |x|
        TeamMoney.where(tournament_id: tourn_id, user_id: x).update(round_two: 0)
      end
    when 3
      user_ids.each do |x|
        TeamMoney.where(tournament_id: tourn_id, user_id: x).update(round_three: 0)
      end
    end
  end

  def total_winnings
    rnd1 = self.round_one
    rnd2 = self.round_two
    rnd3 = self.round_three
    total = rnd1 + rnd2 + rnd3

    self.update_columns(total: total)
  end
end
