# frozen_string_literal: true

module Tourney
  module Services
    module CalculateTeamScores
      class Score2 < Tourney::Services::CalculateTeamScores::Base
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
          elsif use_score1?
            score1_hash
          elsif next_score?
            next_score_hash
          end
        end

        def use_new_score?
          !first_score? && new_score? && !less_than_score1? && less_than_score2? ||
            (first_score? && both_scores?)
        end

        def use_score1?
          (!first_score? &&
            (score1_update? && !less_than_score2? && less_than_score3?) ||
            (new_score? && less_than_score1?)
          ) ||
            (first_score? && both_scores?) ||
            (score2_update? && less_than_score1? && !both_scores?)
        end

        def next_score?
          (!less_than_score3? &&
            (score1_update? || score2_update?)
          )
        end
      end
    end
  end
end
