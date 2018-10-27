module Leaderboards
  class Updates

    def self.call(scorecard, tournament_round)
      new(scorecard, tournament_round).call
    end

    def initialize(scorecard, tournament_round)
      @scorecard   = scorecard
      @course      = tournament_round.new_course
      @round       = scorecard.round_num
      @rnds        = (1..3).to_a - [round]
      @leaderboard = scorecard.leaderboard
      @played      = course_par
    end

    def call
      ActiveRecord::Base.transaction do
        leaderboard.update(scores_hash)
      end
    rescue StandardError => e
      p "error #{e}"
    end

    private
    attr_reader :scorecard, :course, :leaderboard, :round, :played, :rnds

    def scores_hash
      {
        "rnd#{round}_score": scorecard.total_net,
        "rnd#{round}_putts": scorecard.total_putts,
        "rnd#{round}_3putts": scorecard.total_3putts,
        net_total: score_agg('total_net'),
        total_putts: score_agg('total_putts'),
        total_3_putts: score_agg('total_3putts'),
        total_score: total_score
      }
    end

    def score_agg(type)
      total = []
      total << scorecard.send("#{type}")
      rnds.each { |x| total << leaderboard.send("rnd#{x}_#{lb_(type)}") }
      total.inject(0, :+)
    end

    def total_score
      tournament = Tournament.includes(:tournament_rounds).find(leaderboard.tournament_id)
      total = []
      total << scorecard.total_net - played

      rnds.each do |x|
        score = leaderboard.send("rnd#{x}_score")
        if score == 0
          total << 0
        else
          par = tournament.tournament_rounds.select { |xx| p xx if x == xx.round_number }.map { |y|p y.new_course.par }[0]
          total << score - par
        end
      end
      total.inject(0, :+)
    end

    def course_par
      return course.par if scorecard.finished
      played = scorecard.user_scores.map(&:number)
      course.holes.select { |x| x if played.include?(x.number) }.map(&:par).inject(0, :+)
    end

    def lb_(type)
      type == 'total_net' ? 'score' : type.split('_')[1]
    end
  end
end