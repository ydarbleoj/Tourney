# frozen_string_literal: true

module Tourney
  module Services
    module CalculateTeamScores
      class Score1 < Tourney::Services::CalculateTeamScores::Base
        def id
          find_lowest_score[0]
        end

        def net
          find_lowest_score[1]
        end

        def update?
          new? || demote_score1? || promote_score2? || net_update? || both_scores?
        end

        private

        def net_update?
          score1_update? && less_than_score2?
        end
      end
    end
  end
end
