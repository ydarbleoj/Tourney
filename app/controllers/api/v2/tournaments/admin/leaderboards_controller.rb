module API
  module V2
    module Tournaments
      module Admin
        class LeaderboardsController < TournamentBaseController
          skip_before_action :authenticate_user
          before_action :set_users

          def index
            set_users
            payload = AdminUsersSerializer.new(@users).serialized_json
            render json: payload
          end

          def update
            res = Admins::UpdatePlayer.call(params)
            payload = AdminUsersSerializer.new(@users).serialized_json
            if res
              render json: payload
            else
              render json: payload
            end
          end

          private
          def set_users
            @users = Leaderboard.admin_users(@tournament.id)
          end

        end
      end
    end
  end
end