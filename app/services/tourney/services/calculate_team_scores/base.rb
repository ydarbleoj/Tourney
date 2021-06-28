# frozen_string_literal: true

module Tourney
  module Services
    module CalculateTeamScores
      class Base
        def initialize(team_score, user_score)
          @team_score = team_score
          @user_score = user_score
        end

        def new_net
          @new_net ||= @user_score.net
        end

        def score1_blank?
          @team_score&.score1_id.blank?
        end

        def score2_blank?
          @team_score.score2_id.blank?
        end

        def score1_update?
          @user_score.id == @team_score.score1_id
        end

        def score2_update?
          @user_score.id == @team_score.score2_id
        end

        def new_user_score?
          !score1_update? && !score2_update? && !new? && !score2_new?
        end


        def new_id
          @new_id ||= @user_score.id
        end

        def less_than_score1?
          return true if new? || @team_score.score1.blank?

          new_net < @team_score.score1
        end

        def less_than_score2?
          return true if @team_score.score2.blank?

          new_net < @team_score.score2
        end

        def less_than_score3?
          return true if next_score_net.blank?

          new_net < next_score_net
        end

        def next_score_net
          @next_score_net ||= @team_score.next_score_net
        end

        def next_score_id
          @next_score_id ||= @team_score.next_score_id
        end

        def demote_score1?
          return false if new?

          (
            (score1_update? && !less_than_score2? && less_than_score3?) ||
            (less_than_score1? &&
              (score2_update? || new_user_score? || (score2_new? && !score1_update?))
            )
          )
        end

        def demote_score2?
          return false if score2_new?

          (score2_update? && !less_than_score3?) ||
            (new_user_score? && less_than_score2? && !less_than_score1?)
        end

        def promote_score2?
          score2_update? && less_than_score1?
        end

        def promote_score3?
          return false if next_score_net.blank?

          next_score_net < new_net
        end

        def team_size
          @team_size ||= @team_score.team_size
        end

        def override_score1?
          (@team_score.score1_id == @team_score.score2_id) &&
            (@user_score.id != @team_score.score1_id)
        end

        def both_scores?
          return false if team_size == 4
          return true if team_size <= 2

          position_match? && less_than_score1?
        end

        def position_match?
          current_position == @user_score.team_position
        end

        def current_position
          return @user_score.number if subtraction.zero?

          @user_score.number - subtraction.to_f
        end

        def subtraction
          case @user_score.number
          when 1..3
            0
          when 4..6
            3
          when 7..9
            6
          when 10..12
            9
          when 13..15
            12
          when 16..18
            15
          else
            0
          end
        end
      end
    end
  end
end
