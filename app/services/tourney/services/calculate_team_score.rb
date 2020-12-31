# frozen_string_literal: true

module Tourney
  module Services
    class CalculateTeamScore
      def initialize(team_score, user_score)
        @team_score = team_score
        @user_score = user_score
        @new_net    = user_score.net
        # @team       = team
      end

      def net
        update? ? @new_net : @team_score.net
      end

      def score1_id
        update_score1? ? @user_score.id : @team_score.score1_id
      end

      def score2_id
        update_score2? ? find_score2 : @team_score.score2_id
      end

      def update?
        update_score1? || update_score2?
      end

      private

      def persisted?
        @persisted ||= @team_score.id.present?
      end

      def update_score1?
        !persisted? || less_than_score1?
      end

      def update_score2?
        persisted? && !update_score1? &&
          (less_than_score2? ||
            @team_score.score2.blank? ||
            demote_score1_id?
          )
      end

      def less_than_score1?
        @less_than_score1 ||= @new_net < @team_score.score1
      end

      def less_than_score2?
        @less_than_score2 ||= @new_net < @team_score.score2
      end

      def demote_score1_id?
        @team_score.score1_id.present? && less_than_score1?
      end

      def calculate_score1
        update_score1? ? @new_net : @team_score.score1
      end

      def calculate_score2
        return @team_score.score2 unless update_score2?
      end

      def id_equals?(score_id)
        @user_score.id == score_id
      end

      def next_lowest_score
        @next ||= team.next_lowest_score(@user_score.number, @user_score.net, score_ids)
      end

      def score_ids
        [score1_id, score2_id].compact
      end

      def promote_score2

      end
    end
  end
end
