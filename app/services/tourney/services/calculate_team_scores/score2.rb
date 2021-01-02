# frozen_string_literal: true

module Tourney
  module Services
    module CalculateTeamScores
      class Score2 < Tourney::Services::CalculateTeamScores::Base
        def initialize(team_score, user_score)
          @team_score = team_score
          @user_score = user_score
        end

        def id
          new? ? nil : find_lowest_score[0]
        end

        def net
          new? ? nil : find_lowest_score[1]
        end

        def update?
          score2_new? || demote_score1? ||
            promote_score3? || net_update? || demote_score2?
        end

        private

        def find_lowest_score
          if score2_new? || less_than_score2? || net_update?
            [new_id, new_net]
          elsif demote_score1?
            [@team_score.score1_id, @team_score.score1]
          elsif promote_score3?
            [next_score_id, next_score_net]
          else
            [@team_score.score2_id, @team_score.score2]
          end
        end

        def score2_new?
          !new? && @team_score.score2_id.blank?
        end

        def net_update?
          score2_update? &&
            !less_than_score1? &&
            !promote_score3?
        end
      end
    end
  end
end
