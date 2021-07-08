# frozen_string_literal: true

class TeamScore < ApplicationRecord
  belongs_to :team
  belongs_to :score_1, class_name: "UserScore"
  belongs_to :score_2, class_name: "UserScore", :optional => true

  has_many :user_scores, :through => :team

  validates :number, presence: true
  validates :net, presence: true

  def score1
    score_1&.net
  end

  def score2
    score_2&.net
  end

  def next_score
    user_scores
      .where.not(:id => [score_1_id, score_2_id])
      .where(:number => number, :par => par)
      .order("user_scores.net asc").first
  end
end
