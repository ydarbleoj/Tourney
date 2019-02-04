module API
  module V2
    module Rounds
      class CoursesController < TournamentBaseController
        skip_before_action :authenticate_user
        before_action :set_round

        def index
          options = {}
          options[:include] = [:round_aggs, :course_aggs]
          @user_data = set_user_data
          render json: {
            course_data: RoundInfo::CourseStatsSerializer.new(@course_data, options).serialized_json,
            user_data: UserCourseAggSerializer.new(@user_data).serialized_json
          }
        end

        private
        def set_round
          @course_data = TournamentRound.course_data(params[:tournament_round_id])
        end

        def set_user_data
          return {} if @tournament_user.blank?
          UserCourseAgg.includes({ easiest_hole: :hole, hardest_hole: :hole }, :lowest_round).where(user_id: current_user.id, new_course_id: @course_data.new_course_id).first
        end

      end
    end
  end
end