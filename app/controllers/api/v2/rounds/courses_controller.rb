module API
  module V2
    module Rounds
      class CoursesController < TournamentBaseController
        skip_before_action :authenticate_user
        before_action :set_round

        def index
          options = {}
          options[:include] = [:round_aggs, :course_aggs]
          render json: RoundInfo::CourseStatsSerializer.new(@course_data, options).serialized_json
        end

        private
        def set_round
          @course_data = TournamentRound.course_data(params[:tournament_round_id])
        end

      end
    end
  end
end