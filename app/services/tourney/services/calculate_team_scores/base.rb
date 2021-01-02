# frozen_string_literal: true

module Tourney
  module Services
    module CalculateTeamScores
      class Base
        def new?
          @team_score&.id.blank?
        end

        def score1_update?
          @user_score.id == @team_score.score1_id
        end

        def score2_update?
          @user_score.id == @team_score.score2_id
        end

        def new_net
          @new_net ||= @user_score.net
        end

        def new_id
          @new_id ||= @user_score.id
        end

        def less_than_score1?
          return true if new?

          new_net < @team_score.score1
        end

        def less_than_score2?
          return false if @team_score.score2_id.blank?

          new_net < @team_score.score2
        end

        def next_score_net
          @next_score_net ||= @team_score.next_score_net
        end

        def next_score_id
          @next_score_id ||= @team_score.next_score_id
        end

        def demote_score1?
          less_than_score1? ||
            (score1_update? && (new_net > @team_score.score2)) ||
            promote_score2?
        end

        def demote_score2?
          !less_than_score1? &&
            less_than_score2? &&
            !score1_update? &&
            !score2_update?
        end

        def promote_score2?
          score2_update? && less_than_score1?
        end

        def promote_score3?
          return false if next_score_net.blank?

          next_score_net < new_net
        end
      end
    end
  end
end
