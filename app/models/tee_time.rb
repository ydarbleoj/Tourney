class TeeTime < ApplicationRecord
  scope :grab_group, -> (tr_id, user_id) { where(tournament_round_id: tr_id, user_id: user_id).first.group }

  belongs_to :user
  belongs_to :tournament_round
  belongs_to :team_scorecard


  validates :group, presence: true
  validates :tee_time, presence: true

  def self.groups_users(user_id)
    includes(team_scorecard: :users)
    .where(user_id: user_id).first
  end

  def self.bulk_update(ids, team_card)
    where(id: ids)
    .update_all(group: team_card['group'], tee_time: team_card['tee_time'], team_scorecard_id: team_card['team_scorecard_id'])
  end

  def self.bulk_create(tr, ids, card)
    ids.each do |x|
      TeeTime.create(
        tournament_round_id: tr.id,
        team_scorecard_id: card['team_scorecard_id'],
        user_id: x,
        tee_time: card['tee_time'],
        group: card['group'])
    end
  end

end
