# frozen_string_literal: true

module API
  module V2
    module Tournaments
      class SummaryController < TournamentBaseController
        skip_before_action :authenticate_user

        def index
          @summary
        end

        private

        def tournament_avgs
          @tournament_avgs ||= @tournament.round_aggs.tournament_avgs
        end

        def lowest_and_highest

        end
      end
    end
  end
end
