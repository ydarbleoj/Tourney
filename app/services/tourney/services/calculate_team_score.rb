# frozen_string_literal: true

module Tourney
  module Services
    class CalculateTeamScore
      attr_reader :number, :par

      def initialize(team_score, user_score)
        @team_score = team_score
        @user_score = user_score
        @new_net    = user_score.net
        @par        = user_score.par
        @number     = user_score.number
      end

      def net
        update? ? (calculate_score1 + calculate_score2) : @team_score.net
      end

      def score1_id
        score1.update? ? score1.id : @team_score.score1_id
      end

      def score2_id
        score2.update? ? score2.id : @team_score.score2_id
      end

      def update?
        score1.update? || score2.update?
      end

      private

      def calculate_score1
        score1.update? ? score1.net.to_i : @team_score.score1
      end

      def score1
        @score1 ||= Tourney::Services::CalculateTeamScores::Score1.new(
          @team_score, @user_score
        )
      end

      def calculate_score2
        score2.update? ? score2.net.to_i : @team_score.score2
      end

      def score2
        @score2 ||= Tourney::Services::CalculateTeamScores::Score2.new(
          @team_score, @user_score
        )
      end
    end
  end
end
