class TeeTime < ApplicationRecord
  scope :grab_group, -> (tr_id, user_id) { where(tournament_round_id: tr_id, user_id: user_id).first.group }

  belongs_to :user
  belongs_to :tournament_round
  belongs_to :team_scorecard


  validates :group, presence: true
  validates :tee_time, presence: true

  def self.group_ids(group, tr_id)
    where(group: group, tournament_round_id: tr_id).pluck(:user_id)
  end

end
