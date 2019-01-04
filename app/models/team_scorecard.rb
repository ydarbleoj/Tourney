class TeamScorecard < ApplicationRecord
  attr_accessor :position
  scope :completed, -> { where(finished: true) }
  scope :card_open, -> { where(finished: false) }
  scope :winning_team, -> { where(is_won: true) }

  belongs_to :new_course
  belongs_to :tournament_round

  has_many :team_scores
  has_many :tee_times
  has_many :users, through: :tee_times

  after_commit :check_for_last_scorecard


  def check_for_last_scorecard
    last_scorecard = TournamentRound.find(self.tournament_round_id).team_scorecards.card_open
    if last_scorecard.blank?
      update_money_lists(self)
    end
  rescue => e
    sp e
  end

  def self.leaderboard(round_id)
    includes({tee_times: [:user]}, :team_scores, :new_course)
    .where(tournament_round_id: round_id)
    .order(group: :asc)
  end
  # def update_money_lists(scorecard)
  #   p "update"
  #   p scorecard
  #   tr = TournamentRound.find(scorecard.tournament_round_id)
  #  p team_won = tr.team_scorecards.where(is_won: true)
  #   low_net = tr.team_scorecards.minimum(:total_net)
  #  p low_scorecards = tr.team_scorecards.includes(:users).where(total_net: low_net)

  #   if team_won.blank?

  #     if low_scorecards.size == 1
  #       p 'here'
  #       user_ids = low_scorecards.first.users.pluck(:id)
  #       low_scorecards.first.update_columns(is_won: true)
  #       TeamMoney.update_round(tr.tournament_id, user_ids, tr.round_number)
  #     else
  #   #   if team_won.total_net == low_net
  #   #     p 'all set'
  #   #   else

  #     end
  #   else
  #     if low_scorecards.size == 1
  #       if low_scorecards.first.id == team_won.first.id
  #         p 'ALL GOOD'
  #       else
  #         team_won.first.update_columns(is_won: false)
  #         remove_users = team_won.users.pluck(:id)
  #         TeamMoney.remove_money(tr.tournament_id, remove_users, tr.round_number)

  #         low_scorecards.first.update_columns(is_won: true)
  #         user_ids = low_scorecards.first.users.pluck(:id)
  #         TeamMoney.update_round(tr.tournament_round_id, user_ids, tr.round_number)
  #       end
  #     else

  #     end
  #   end

  # end


  def self.find_lowest(team_scorecards, tr)
    teams = []
    team_scorecards.each do |card|
      users = card.users.pluck(:id)
      scores = low_team_score(users, card)
      teams << [scores, card]
    end
    teams
  end

  def self.low_team_score(users, card)
    Scorecard.where(tournament_round_id: card.tournament_round_id, user_id: users)
      .order(total_net: :asc).pluck(:total_net).first(2)
  end
end
