module Aggs
  class UserUpdate

    def self.call(user_id)
      new(user_id).call
    end

    def initialize(user_id)
      @user_id = user_id
      @agg     = UserAgg.where(user_id: user_id).first_or_create
    end

    def call
      avg   = averages
      lr    = lowest_round
      hcap  = hcap_info
      stats = avg.merge(lr.merge(hcap))
      res = agg.update(stats.compact)
    rescue StandardError => e
      p "Error User Update #{e.message} : User #{user_id}"
      false
    end

    private
    attr_accessor :user_id, :agg

    def averages
      h = agg.calc_avgs[0]
      h['gross_avg'].blank? ? {} : h.attributes.except('id', 'count')
    end

    def lowest_round
      h = agg.lowest_round
      h.blank? ? {} : { lowest_round_id: h.id }
    end

    def hcap_info
      h = agg.calc_hcap_diff[0]
      h.blank? ? {} : h.attributes.except('id')
    end
  end
end