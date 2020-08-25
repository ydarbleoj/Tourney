# frozen_string_literal: true

module Tourney
  module Services
    class TeamScoring
      def initialize(user_score)
        @user_score = user_score
        @scorecard  = user_score.scorecard
      end

      def execute
        return unless calculate_team_score.update?

        Tourney::Repository::Team::Score.persist(
          team,
          team_score_entity
        )
        Tourney::Repository::Team::Update.execute(team.reload)
      end

      private

      def team
        @team ||= @scorecard.team
      end

      def team_score
        @team_score ||= team.team_scores.find_or_initialize_by(
          :number => @user_score.number,
          :par    => @user_score.par
        )
      end

      def team_score_entity
        Tourney::Entities::Team::Score.new(
          :id         => team_score.id,
          :team_id    => team.id,
          :number     => team_score.number,
          :net        => calculate_team_score.net,
          :par        => team_score.par,
          :score_1_id => calculate_team_score.score1_id,
          :score_2_id => calculate_team_score.score2_id
        )
      end

      def calculate_team_score
        Tourney::Services::CalculateTeamScore.new(team_score, @user_score)
      end
    end
  end
end
