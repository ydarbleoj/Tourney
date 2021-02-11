module API
  module V2
    module Leaderboards
      class SkinsController < TournamentBaseController
        skip_before_action :authenticate_user
        before_action :set_leaderboards
        before_action :set_positions

        def index
          if params[:preview] == "true"
           payload = Scoreboard::SkinsPreviewSerializer.new(
             set_preview
           ).serialized_json
          else
            payload = Scoreboard::SkinsSerializer.new(@leaderboards).serializable_hash
          end
          render json: payload
        end

        private

        def set_leaderboards
          @leaderboards = Leaderboard.skins(@tournament.id)
        end

        def set_positions
          Position.skins_setter(@leaderboards, :net_skin_total)
          @leaderboards = @leaderboards.sort_by { |x| x.position }
        end

        def set_preview
          @leaderboards.first(3)
        end
      end
    end
  end
end
