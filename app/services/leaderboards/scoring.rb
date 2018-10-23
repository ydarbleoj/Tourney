module Leaderboards
  class Scoring

    def self.call(id)
      new(id).call
    end

    def initialize(id)
      @scorecard   = Scorecard.find(id)
      @course      = scorecard.new_course
      @tourn_rnd   = scorecard.tournament_round
      @user_scores = scorecard.user_scores
      @leaderboard = scorecard.leaderboard
    end

    def call
      p leaderboard
    end

    private
    attr_reader :scorecard, :course, :tourn_rnd, :leaderboard, :user_scores



  end
end