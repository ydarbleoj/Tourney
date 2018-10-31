class TeamScore < ApplicationRecord
  belongs_to :team_scorecard

  validates :number, presence: true
  validates :net, presence: true

  after_save :update_team_scorecard

  def update_team_scorecard
    total_net = team_scorecard.team_scores.select('SUM(net) AS total_net')[0].as_json
    team_scorecard.update(total_net.except!('id'))
  end

end
