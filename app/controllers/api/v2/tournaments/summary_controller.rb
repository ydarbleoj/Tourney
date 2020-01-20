# frozen_string_literal: true

module Api
  module V2
    module Tournaments
      class SummaryController < TournamentBaseController
        skip_before_action :authenticate_user

        def index
          @summary
        end

        private

        def hardest_course

        end

        def easiest_course

        end

        def lowest_round

        end

        def highest_round

        end

        def hcap_diff

        end

        def net_avg

        end

        def putting_avg

        end

        def three_putt_avg

        end

        def hardest_hole

        end

        def easiest_hole

        end

        def hardest_par_3

        end

        def hardest_par_4

        end

        def hardest_par_5

        end

        def easiest_par_3

        end

        def easiest_par_4

        end

        def easiest_par_5

        end
      end
    end
  end
end
