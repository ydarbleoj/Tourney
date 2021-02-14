# frozen_string_literal: true

module Tourney
  module Services
    module CalculateTeamScores
      class Score1 < Tourney::Services::CalculateTeamScores::Base
        def initialize(team_score, user_score)
          @team_score = team_score
          @user_score = user_score
        end

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

        def find_lowest_score
          if new? || demote_score1? || net_update? || both_scores?
            [new_id, new_net]
          elsif promote_score2?
            [@team_score.score2_id, @team_score.score2]
          else
            [@team_score.score1_id, @team_score.score1]
          end
        end

        def net_update?
          score1_update? && less_than_score2?
        end
      end
    end
  end
end
