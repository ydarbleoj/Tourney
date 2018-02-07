class SkinsMoney < ApplicationRecord
  belongs_to :tournament
  belongs_to :user

  has_many :scorecards, through: :user

  after_commit :update_total

  def self.total_leaderboard
    order(total: :desc)
    .select(:user_id, :round_one, :round_two, :round_three, :total)
    .map do |x|
      {
        user_id: x[:user_id],
        money: [{
          round_one: x.round_one,
          round_two: x.round_two,
          round_three: x.round_three,
          money_total: x.total
        }]
      }
    end
  end

   def self.preview_leaderboard(user_ids)
    order(total: :desc)
    .where(user_id: user_ids)
    .select(:user_id, :round_one, :round_two, :round_three, :total)
    .map do |x|
      {
        user_id: x[:user_id],
        money: [{
          round_one: x.round_one,
          round_two: x.round_two,
          round_three: x.round_three,
          money_total: x.total
        }]
      }
    end
  end

  def update_total
    rnd1 = self.round_one
    rnd2 = self.round_two
    rnd3 = self.round_three
    total = rnd1 + rnd2 + rnd3
    self.update_column(:total, total)
  end

  def self.update_player_money(scorecard)
    p 'THEN HETE'
    tournament = TournamentRound.find(scorecard.tournament_round_id).tournament
    round = set_round(scorecard.round_num)
    scorecards = TournamentRound.find(scorecard.tournament_round_id).scorecards.skins_total

    total_skins = scorecards.inject(0) { |sum, total| sum + total[:total] }
    money = ((tournament.num_players * 10) / total_skins).round(2)

    scorecards.each do |sc|
      skins_money = SkinsMoney.where(user_id: sc[:user_id], tournament_id: tournament.id)
        .first.update(round.to_sym => (money * sc[:total]))
    end
  end

  def self.set_round(rnd_num)
    case rnd_num
    when 1
      'round_one'
    when 2
      'round_two'
    when 3
      'round_three'
    end
  end

end
