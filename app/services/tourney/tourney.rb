# frozen_string_literal: true

module Tourney
  def tournament
  end

  def round_one
  end

  def round_two
  end

  def round_three
  end

  def self.update_leaderboards(user_score_id:)
    Tourney::UpdateLeaderboards.new(user_score_id)
  end
end
