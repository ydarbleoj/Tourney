module Aggs
  class RoundSetup

    def self.call(round_id)
      new(round_id).call
    end

    def initialize(round_id)
      @round_id  = round_id
      @round     = set_round
    end

    def call
      p "ROUND #{round_id}"
      avgs  = card_avgs
      holes = hole_avgs
      lr    = lowest_round
      diff  = hole_diff
      p diff  = diff.merge(lr)
      stats = avgs.merge(holes.merge(diff).compact)
      p 'STATS'
      p stats
      ActiveRecord::Base.transaction do
        round.update(stats.compact)
      end
    rescue StandardError => e
      p "error #{e.message} - #{round_id} "
      false
    end

    private
    attr_reader :round_id, :round

    def card_avgs
      res = round.scorecard_avgs
      res[0].attributes.except('id')
    end

    def hole_avgs
      h = {}
      p 'hole_avgs'
      res = round.hole_par_avgs
      h['par3_avg'] = '%.2f' % res[3] ||= 0
      h['par4_avg'] = '%.2f' % res[4] ||= 0
      h['par5_avg'] = '%.2f' % res[5] ||= 0
      h
    end

    def lowest_round
      p 'lowest_round'
p      h = round.lowest_round
      h.blank? ? {} : { lowest_round_id: h.id }
    end

    def hole_diff
      res = round.hole_difficulty
      return {} if res[0]['hole_diff'].blank?
      h = {}
      p 'hole_difficulty'
      h['easiest_hole_id'] = res[-1]['hole_id']
      h['hardest_hole_id'] = res[0]['hole_id']
      h
    end

    def set_round
      RoundAgg.where(tournament_round_id: round_id).first_or_create
    end

  end
end