# frozen_string_literal: true

class TeamScore < ApplicationRecord
  belongs_to :team
  belongs_to :score_1, class_name: "UserScore"
  belongs_to :score_2, class_name: "UserScore", :optional => true

  validates :number, presence: true
  validates :net, presence: true
end
