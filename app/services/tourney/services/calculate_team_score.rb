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
        update? ? (score1.net + score2.net.to_i) : @team_score.net
      end

      def score1_id
        update? ? score1.id : @team_score.score1_id
      end

      def score2_id
        update? ? score2.id : @team_score.score2_id
      end

      def update?
        score1.update? || score2.update?
      end

      private

      def score1
        @score1 ||= Tourney::Services::CalculateTeamScores::Score1.new(
          @team_score, @user_score
        )
      end

      def score2
        @score2 ||= Tourney::Services::CalculateTeamScores::Score2.new(
          @team_score, @user_score
        )
      end
    end
  end
end
