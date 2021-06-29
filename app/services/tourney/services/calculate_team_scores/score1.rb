# frozen_string_literal: true

module Tourney
  module Services
    module CalculateTeamScores
      class Score1 < Tourney::Services::CalculateTeamScores::Base
        def id
          return unless score.present?

          score[:id]
        end

        def net
          return unless score.present?

          score[:net]
        end

        def update?
          score.present?
        end

        private

        def score
          @score ||= find_score
        end

        def find_score
          if use_new_score?
            new_score_hash
          elsif use_score2?
            score2_hash
          end
        end

        def use_new_score?
          (new_score? && less_than_score1?) ||
            (score1_update? && less_than_score1?)
        end

        def use_score2?
          (score2_update? && less_than_score1?) ||
            (score1_update? && !less_than_score2?)
        end
      end
    end
  end
end
