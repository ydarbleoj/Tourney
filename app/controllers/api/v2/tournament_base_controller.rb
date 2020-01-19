# frozen_string_literal: true

module API
  module V2
    class TournamentBaseController < ApplicationController
      before_action :authenticate_user
      before_action :set_tournament
      before_action :check_tournament_user

      def set_tournament
        @tournament = Tournament.find(params['tournament_id'])
      end

      def check_tournament_user
        @tournament_user = current_user.blank? ? false : @tournament.users.where(id: current_user.id).exists?
      end
    end
  end
end
