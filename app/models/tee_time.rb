class TeeTime < ApplicationRecord
  scope :grab_group, -> (tr_id, user_id) { where(tournament_round_id: tr_id, user_id: user_id).first.group }

  belongs_to :user
  belongs_to :tournament_round
  belongs_to :team


  validates :group, presence: true
  validates :tee_time, presence: true

  def self.groups_users(user_id)
    includes(team: :users)
    .where(user_id: user_id).first
  end

  def self.bulk_set(params)
    @card_id  = params['id']
    @tee_time = params['group_time']
    @tr_id    = params['tournament_round_id']
    @group    = params['group']

    params['players'].each do |x|
      user = x['attributes'].blank? ? x : x['attributes']
      p x['id']
      if user['tee_time_id'].blank?
        _create(x['id'])
      else
        _update(user['tee_time_id'])
      end
    end
  end

  def self._update(id)
    TeeTime.find(id).update(
      group: @group,
      team_id: @card_id,
      tee_time: @tee_time,
    )
  end

  def self._create(user_id)
    TeeTime.create!(
      tournament_round_id: @tr_id,
      team_id: @card_id,
      group: @group,
      tee_time: @tee_time,
      user_id: user_id,
    )
  end

end
