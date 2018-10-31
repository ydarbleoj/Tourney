module Leaderboards
  class TeamScoring

    def self.call(user_score)
      new(user_score).call
    end

    def initialize(user_score)
      @number           = user_score.number
      @tournament_round = user_score.tournament_round
      @tee_times        = tournament_round.tee_times.groups_users(user_score.user.id)
      @team_scorecard   = tee_times.team_scorecard
      @user_ids         = users
    end

    def call
      return if tee_times.blank?
      return if users.blank?
      sum_team_scores
      build_team_score
    rescue StandardError => e
      p "error #{e}"
    end

    private
    attr_reader :number, :tournament_round, :tee_times, :user_ids, :score, :team_scorecard

    def build_team_score
      team_score = team_scorecard.team_scores.find_or_create_by(number: number)
      team_score.update(net: score)
    end

    def sum_team_scores
      @score = tournament_round.scorecards.add_team_score(user_ids, number)
    end

    def users
      team_scorecard.users.map(&:id)
    end
  end
end