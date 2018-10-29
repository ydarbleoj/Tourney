module Leaderboards
  class Updates

    def self.call(scorecard, tournament_round)
      new(scorecard, tournament_round).call
    end

    def initialize(scorecard, tournament_round)
      @scorecard   = scorecard
      @course      = tournament_round.new_course
      @round       = scorecard.round_num
      @leaderboard = scorecard.leaderboard
      @played      = course_par
    end

    def call
      scores_hash = totals_agg
      ActiveRecord::Base.transaction do
        leaderboard.update(scores_hash.merge(total_score))
      end
    rescue StandardError => e
      p "error #{e}"
    end

    private
    attr_reader :scorecard, :course, :leaderboard, :round, :played, :rnds

    def totals_agg
      leaderboard.scorecard_totals
    end

    def total_score
      total = []
      total << scorecard.total_net - played
      total << leaderboard.current_total_score
      total.compact.inject(0, :+)
      { "total_score" => total.compact.inject(0, :+) }
    end

    def course_par
      return course.par if scorecard.finished
      num = scorecard.user_scores.sort_by(&:number).last.number
      course.current_par(num)
    end

  end
end