module Scoreboard
  class Updates

    def self.call(id)
      new(id).call
    end

    def initialize(id)
      @leaderboard = Leaderboard.scorecard_totals(id)
    end

    def call
      map_totals
      ActiveRecord::Base.transaction do
        leaderboard.update(totals)
      end
    rescue StandardError => e
      p "error #{e}"
    end

    private
    attr_reader :leaderboard, :totals

    def map_totals
      @totals = Hash.new(0)
      leaderboard.scorecards.each do |scorecard|
        totals[:net_total] += scorecard.total_net
        totals[:total_putts] += scorecard.total_putts
        totals[:total_3_putts] += scorecard.total_3putts
        totals[:total_score] += total_score(scorecard)
      end
      totals
    end

    def total_score(scorecard)
      p "SCOF"
      p scorecard
      if scorecard.finished && !scorecard.dnf
        scorecard.total_net - scorecard.new_course.par
      else
        par_so_far = scorecard.user_scores.map { |x| x.hole.par }.inject(0, :+)
        scorecard.user_scores.map(&:net).inject(0, :+) - par_so_far
      end
    end

  end
end