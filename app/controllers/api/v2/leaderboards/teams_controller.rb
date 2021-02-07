module API
  module V2
    module Leaderboards
      class TeamsController < TournamentBaseController
        skip_before_action :authenticate_user
        before_action :set_leaderboards
        before_action :set_positions

        def index
          @leaderboards = @leaderboards.sort_by(&:position)
          if params[:preview] == "true"
            options = { include: [:new_course] }
            payload = Scoreboard::TeamPreviewSerializer.new(@leaderboards, options).serialized_json
          else
            options = { include: [:new_course, :tee_times, :team_scores]}
            payload = Scoreboard::TeamSerializer.new(@leaderboards, options).serialized_json
          end
          render json: payload
        end

        private
        def set_leaderboards
          round_id = @tournament.tournament_rounds.find_by(round_number: params[:round_id])
          @leaderboards = Team.leaderboard(round_id)
        end

        def set_positions
          Position.setter(@leaderboards, :total_net)
        end
      end
    end
  end
end