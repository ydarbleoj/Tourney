class TeamScore < ApplicationRecord
  belongs_to :team
  belongs_to :user_score_1, class_name: "UserScore"
  belongs_to :user_score_2, class_name: "UserScore"

  validates :number, presence: true
  validates :net, presence: true

  after_save :update_team

  def update_team
    total_net = team.team_scores.select('SUM(net) AS total_net')[0].as_json
    team.update(total_net.except!('id'))
  end

end
