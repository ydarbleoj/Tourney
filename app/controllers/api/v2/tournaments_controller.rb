module API
  module V2
    class TournamentsController < ApplicationController
      before_action :authenticate_user

      def index
        payload = Tournament.current_and_list('Bandon')
        render json: {
          tournament: TournamentSerializer.new(payload).serialized_json
        }
      end

      def create
        @tournament = Tournament.create!(tournament_params)

        begin
          if @tournament.save
            build_lists

            render json: {
              success: true,
              user_list: UserSerializer.new(@user_list).serialized_json,
              course_list: NewCourseSerializer.new(@course_list).serialized_json,
              tournament: TournamentCreateSerializer.new(@tournament).serialized_json
            }
          else
            render json: { success: false, user_list: [], course_list: [], tournament: nil }
          end
        rescue StandardError => e
          p "erorr #{e}"
          render json: { success: false, message: e }
        end
      end


      private

      def tournament_params
        params.require(:tournament).permit(:name, :year, :num_rounds, :num_players, :start_date, :end_date)
      end

      def build_lists
        # @user_list = []
        # @course_list = []
        # Tournament.includes({tournament_users: :user}, :new_courses).where(name: @tournament.name).each do |tourn|
        #   @user_list << tourn.users
        # end
        @user_list = User.all
        @course_list << NewCourse.all
      end
    end
  end
end
