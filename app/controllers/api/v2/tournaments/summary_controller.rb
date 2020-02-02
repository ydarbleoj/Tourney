# frozen_string_literal: true

module API
  module V2
    module Tournaments
      class SummaryController < TournamentBaseController
        skip_before_action :authenticate_user

        def index
          render json: summary
        end

        private

        def summary
          ::Tournaments::Summary::Index.new(@tournament.id, current_user).to_h
        end
      end
    end
  end
end
