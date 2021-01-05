# frozen_string_literal: true

module API
  module V2
    class TournamentBaseController < ApplicationController
      before_action :authenticate_user
      before_action :set_tournament
      before_action :check_tournament_user
      before_action :set_current_leaderboard

      def set_tournament
        @tournament = Tournament.find(params['tournament_id'])
      end

      def check_tournament_user
        @tournament_user = current_user.blank? ? false : @tournament.users.where(id: current_user.id).exists?
      end

      def set_current_leaderboard
        return nil if current_user.blank?

        @current_leaderboard = @tournament.leaderboards.find_by(
          :user_id => current_user.id
        )
      end

      def preview_leaderboards

        (@leaderboards.first(3) + [@current_leaderboard]).uniq(&:user_id)
      end
    end
  end
end
