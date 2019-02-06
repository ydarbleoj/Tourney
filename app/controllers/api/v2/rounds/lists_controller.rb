module API
  module V2
    module Rounds
      class ListsController < TournamentBaseController
        skip_before_action :authenticate_user

        def index
          payload = @tournament.tournament_rounds.rounds
          user_times = user_tee_times

          render json: {
            rounds: RoundInfo::ListSerializer.new(payload).serialized_json,
            user_times: TeeTimeSerializer.new(user_times.compact).serialized_json
          }
        end


        private

        def user_tee_times
          return false if @tournament_user.blank?
          @tournament.tournament_rounds.map do |round|
            TeeTime.includes(:tournament_round).where(user_id: current_user.id, tournament_round_id: round.id).first
          end
        end
      end
    end
  end
end