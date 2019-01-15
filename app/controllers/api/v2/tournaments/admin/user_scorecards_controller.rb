module API
  module V2
    module Tournaments
      module Admin
        class UserScorecardsController < TournamentBaseController
          skip_before_action :authenticate_user

          def index
            set_leaderboard

            payload = Admins::UserScorecardsSerializer.new(@leaderboard, { include: [:scorecards, :new_course, :'new_course.holes']}).serialized_json
            render json: payload
          end

          private
          def set_leaderboard
            p @leaderboard = Leaderboard.admin_user_scorecards(params['leaderboard_id'])
          end
        end
      end
    end
  end
end