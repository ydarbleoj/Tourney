module API
  module V2
    module Tournaments
      module Admin
        class TeeTimesController < TournamentBaseController
          skip_before_action :authenticate_user
          before_action :set_tee_times
          before_action :set_awaiting, only: [:index]

          def index
            render json: {
              times: Admins::TeeTimesSerializer.new(@tee_times).serialized_json,
              awaiting: Admins::AwaitingSerializer.new(@awaiting).serialized_json
            }
          end

          def create
            res = TeeTime.bulk_set(params['tee_time'])
          end

          private
          def set_tee_times
            @tee_times = TeamScorecard.admin_tee_times(params[:tournament_round_id])
          end

          def set_awaiting
            ids = users_with_times
            @awaiting = @tournament.users.where.not(id: ids)
          end

          def users_with_times
            ids = []
            @tee_times.each do |card|
              ids << card.tee_times.map(&:user_id)
            end
            ids.flatten
          end

        end
      end
    end
  end
end