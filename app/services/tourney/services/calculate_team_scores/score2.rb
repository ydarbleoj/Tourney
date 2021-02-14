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
          (new? && !both_scores?) ? nil : lowest_score[0]
        end

        def net
          (new? && !both_scores?) ? nil : lowest_score[1]
        end

        def update?
          net.blank?
        end

        private

        def lowest_score
          @lowest_score ||= find_lowest_score
        end

        def find_lowest_score
          if score2_new?
            if demote_score1? || both_scores?
              [@team_score.score1_id, @team_score.score1]
            else
              [new_id, new_net]
            end
          elsif score2_update?
            if less_than_score1?
              [@team_score.score1_id, @team_score.score1]
            elsif less_than_score3?
              [@team.score2_id, new_net]
            else
              [next_score_id, next_score_net]
            end
          elsif score1_update?
            if both_scores?
              if less_than_score2?
                [@team_score.score1_id, @team_score.score1]
              elsif less_than_score3?
                [@team_score.score1_id, @team_score.score1]
              else
                [@team_score.score2_id, @team_score.score2]
              end
            elsif less_than_score2?
              [@team_score.score2_id, @team_score.score2]
            elsif less_than_score3?
              [@team_score.score1_id, @team_score.score1]
            else
              [next_score_id, next_score_net]
            end
          elsif new_user_score?
            if less_than_score2? && !less_than_score1?
              [new_id, new_net]
            else
              [nil, nil]
            end
          end
        end
      end
    end
  end
end
