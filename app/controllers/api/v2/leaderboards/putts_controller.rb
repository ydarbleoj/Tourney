module API
  module V2
    module Leaderboards
      class PuttsController < TournamentBaseController
        skip_before_action :authenticate_user
        before_action :set_leaderboards
        before_action :set_positions

        def index

          if params[:preview] == "true"
            payload = Scoreboard::PuttingPreviewSerializer.new(@leaderboards).serialized_json
          else
            options = {}
            options[:include] = [:scorecards, :user]

            payload = Scoreboard::PuttingSerializer.new(@leaderboards, options).serialized_json
          end
          render json: payload
        end

        private
        def set_leaderboards
          @leaderboards = Leaderboard.putting(@tournament.id)
        end

        def set_positions
          Position.setter(@leaderboards, :total_putts)
        end

      end
    end
  end
end