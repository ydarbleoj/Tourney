class TeeTime < ApplicationRecord
  belongs_to :user
  belongs_to :tournament_round

  validates :group, presence: true
  validates :tee_time, presence: true


end
