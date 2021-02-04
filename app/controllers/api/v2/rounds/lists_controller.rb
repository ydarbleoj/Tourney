module API
  module V2
    module Rounds
      class ListsController < TournamentBaseController
        skip_before_action :authenticate_user

        def index
          payload = @tournament.tournament_rounds.rounds

          render json: {
            rounds: RoundInfo::ListSerializer.new(
              payload
            ).serialized_json,
            user_times: TeeTimeSerializer.new(
              user_tee_times.compact
            ).serialized_json,
            scorecard_previews: RoundInfo::ScorecardPreviewSerializer.new(
              user_scorecards
            ).serialized_json
          }
        end


        private

        def user_tee_times
          return false if @tournament_user.blank?

          @tournament.tournament_rounds.map do |round|
            TeeTime.includes(:tournament_round).where(user_id: current_user.id, tournament_round_id: round.id).first
          end
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
