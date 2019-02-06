module API
  module V2
    module Leaderboards
      class StrokesController < TournamentBaseController
        skip_before_action :authenticate_user
        before_action :set_leaderboards
        before_action :set_positions

        def index
          if params[:preview] == "true"
            payload = Scoreboard::StrokesPreviewSerializer.new(@leaderboards).serialized_json
          else
            options = {}
            options[:include] = [:scorecards, :'scorecards.user_scores', :user]
            set_greens_in_reg

            payload = Scoreboard::StrokesSerializer.new(@leaderboards, options).serialized_json
          end
          render json: payload
        end

        private
        def set_leaderboards
          @leaderboards = Leaderboard.strokes(@tournament.id)
        end

        def set_positions
          Position.setter(@leaderboards, :total_score)
        end

        def set_greens_in_reg
          GreensInReg.call(@leaderboards)
        end
      end
    end
  end
end