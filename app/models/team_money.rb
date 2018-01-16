class TeamMoney < ApplicationRecord
  belongs_to :user
  belongs_to :tournament


  def self.update_round(tourn_id, user_ids, round_number)
    players = Tournament.find(tourn_id).num_players
    money = (10 * players) / 4

    case round_number
    when 1
      TeamMoney.where(tournament_id: tourn_id, user_id: user_ids).update_all(round_one: money)
    when 2
      TeamMoney.where(tournament_id: tourn_id, user_id: user_ids).update_all(round_two: money)
    when 3
      TeamMoney.where(tournament_id: tourn_id, user_id: user_ids).update_all(round_three: money)
    end
  end
end
