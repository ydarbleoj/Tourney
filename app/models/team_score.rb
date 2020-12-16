# frozen_string_literal: true

class TeamScore < ApplicationRecord
  belongs_to :team
  belongs_to :score_1, class_name: "UserScore"
  belongs_to :score_2, class_name: "UserScore", :optional => true

  validates :number, presence: true
  validates :net, presence: true

  def score_1_net
    score_1.net
  end

  def score_2_net
    score_2.net
  end
end
