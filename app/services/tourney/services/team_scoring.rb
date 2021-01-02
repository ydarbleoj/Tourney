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
          team, calculate_team_score
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
          :net        => team_score.net,
          :par        => team_score.par,
          :score1_id  => team_score.score_1_id,
          :score2_id  => team_score.score_2_id,
          :score1     => team_score.score1,
          :score2     => team_score.score2,
          :next_score => team_score.next_score
        )
      end

      def user_score_entity
        Tourney::Entities::UserScore.new(@user_score.attributes.symbolize_keys)
      end

      def calculate_team_score
        @cts ||= Tourney::Services::CalculateTeamScore.new(
          team_score_entity,
          user_score_entity
        )
      end
    end
  end
end
