# This object is called in Leaderboard.scorecard_update(scorecard) method.
# The object takes a @scorecard object and updates the corresponding round info
# and totals
module Leaderboards
  class Update

    def initialize(scorecard)
      @scorecard     = scorecard
      @tournament_id = scorecard.tournament_round.tournament_id
      @leaderboard   = scorecard.leaderboard
      @round         = @scorecard.round_num
    end

    def execute
      #
      # Error handling / better messaging here
      #
      @leaderboard.update_columns(attr_mapping)
    end

    private
    def attr_mapping
      {
        "rnd#{@round}_score": @scorecard.total_net,
        "rnd#{@round}_putts": @scorecard.total_putts,
        "rnd#{@round}_3putts": @scorecard.total_3putts,
        total_score: @leaderboard.calculate_total_score,
        total_putts: sum_totals('putts', @scorecard.total_putts),
        net_total: sum_totals('score', @scorecard.total_net),
        total_3_putts: sum_totals('3putts', @scorecard.total_3putts)
      }
    end

    def sum_totals(attr, sc_attr)
      total = []
      total << sc_attr

      [(1..3).to_a - [@round]].flatten.each do |round|
        rnd = "rnd#{round}_" + attr
        total << @leaderboard.send(rnd)
      end
      total.inject(0, :+)
    end
  end
end