class TeamScorecard < ApplicationRecord
  scope :completed, -> { where(finished: true) }
  scope :card_open, -> { where(finished: false) }
  scope :winning_team, -> { where(is_won: true) }

  belongs_to :new_course
  belongs_to :tournament_round

  has_many :team_scores
  has_many :tee_times
  has_many :users, through: :tee_times

  after_save :check_for_last_scorecard


 def check_for_last_scorecard
    last_scorecard = TournamentRound.find(self.tournament_round_id).team_scorecards.card_open
    if last_scorecard.blank?
      begin
        update_money_lists(self)
      rescue => e
        p e
      end
    end
  end

  def update_money_lists(scorecard)
    tr = TournamentRound.find(scorecard.tournament_round_id)
    user_ids = tr.team_scorecards.order(total_net: :asc).first.users.pluck(:id)

    TeamMoney.update_round(tr.tournament_id, user_ids, tr.round_number)
    scorecard.update(is_won: true)
  end
end
