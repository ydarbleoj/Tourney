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
          !net.blank?
        end

        private

        def lowest_score
         p @lowest_score ||= find_lowest_score
        end

        def find_lowest_score
          p 'hello 99'
          p new_net
          p new_id
          if score2_new?
            p 'new  score'
            if demote_score1? || both_scores?
              p 'deom or both'
              [@team_score.score1_id, @team_score.score1]
            elsif !score1_update?
              p 'new score inside'
              [new_id, new_net]
            else
              [nil, nil]
            end
          elsif score2_update?
            p 'update 2'
            if less_than_score1?
              p 'less than2 '
              [@team_score.score1_id, @team_score.score1]
            elsif less_than_score3?
              p 'less than 3'
              [@team.score2_id, new_net]
            else
              p 'update wiht next '
              [next_score_id, next_score_net]
            end
          elsif score1_update?
            p 'score1 update'
            if both_scores?
              p 'both'
              if less_than_score2?
                p 'leshtan2'
                [@team_score.score1_id, @team_score.score1]
              elsif less_than_score3?
                p 'less than 3'
                [@team_score.score1_id, @team_score.score1]
              else
                [@team_score.score2_id, @team_score.score2]
              end
            elsif less_than_score2?
              p 'less than 2'
              [@team_score.score2_id, @team_score.score2]
            elsif less_than_score3?
              [@team_score.score1_id, @team_score.score1]
            else
              [next_score_id, next_score_net]
            end
          elsif new_user_score?
            p 'new user score '
            if less_than_score2? && !less_than_score1?
              p 'less than 2 and 1'
              [new_id, new_net]
            else
              p 'too high '
              [nil, nil]
            end
          end
        end
      end
    end
  end
end
