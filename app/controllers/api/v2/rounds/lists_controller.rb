module API
  module V2
    module Rounds
      class ListsController < TournamentBaseController
        skip_before_action :authenticate_user

        def index
          payload = @tournament.tournament_rounds.rounds

          # user_times: TeeTimeSerializer.new(
          #   user_tee_times
          # ).serialized_json,
          render json: {
            rounds: RoundInfo::ListSerializer.new(
              payload
            ).serialized_json,
            scorecard_previews: RoundInfo::ScorecardPreviewSerializer.new(
              user_scorecards
            ).serialized_json
          }
        end


        private

        def user_tee_times
        end

        def user_scorecards
          current_user.scorecards.includes(:new_course)
                      .where(
                        :tournament_round_id => current_tournament_rounds.pluck(:id)
                      )
        end
      end
    end
  end
end
