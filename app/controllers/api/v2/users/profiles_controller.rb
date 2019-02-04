module API
  module V2
    module Users
      class ProfilesController < ApplicationController
        before_action :authenticate_user
        before_action :set_data, only: [:index]

        def index
          render json: {
            user_data: UserAggsSerializer.new(@data).serialized_json,
            user: UserSerializer.new(current_user).serialized_json,
          }
        end

        def update
          current_user.update(user_params)
          if current_user.save
            render json: UserSerializer.new(current_user).serialized_json
          else
            render json: { success: false }
          end
        end

        private
        def set_data
          @data = UserAgg.includes({lowest_round: :new_course}).where(user_id: current_user.id).first
        end

        def user_params
          params.require(:user).permit(:handicap, :first_name, :last_name, :username, :email, :gender, :password, :password_confirmation, :home, :profile_image)
        end
      end
    end
  end
end