# frozen_string_literal: true

module Tourney
  module Services
    class CalculateTeamScore
      def initialize(team_score, user_score)
        @team_score = team_score
        @user_score = user_score
        @new_net    = user_score.net
      end

      def net
        @new_net + (update_score1? ? score2&.net.to_i : score1&.net.to_i)
      end

      def score1_id
        update_score1? ? @user_score.id : @team_score.score_1_id
      end

      def score2_id
        update_score2? ? @user_score.id : @team_score.score_2_id
      end

      def update?
        update_score1? || update_score2?
      end

      private

      def update_score1?
        return true unless @team_score.persisted?


        @new_net < score1.net
      end

      def update_score2?
        return false unless @team_score.persisted?
        return true unless score2.present?

        @new_net < score2.net
      end

      def score1
        @score1 ||= @team_score.score_1
      end

      def score2
        @score2 ||= @team_score.score_2
      end

      def id_equals?(score_id)
        @user_score.id == score_id
      end

      def lower_than_both?
        update_score1? && update_score2?
      end

      def next_lowest_score
        @next ||= team.next_lowest_score(@user_score.number, @user_score.net, score_ids)
      end

      def filled?
        score1.present? && score2.present?
      end

      def score_ids
        [score1_id, score2_id].compact
      end

      def team
        @team ||= @team_score.team
      end
    end
  end
end
