module Leaderboards
  module Skins
    class TotalsController  < ApplicationController
      before_action :authenticate_user
      before_action :set_tournament

      def index
        p leaderboards = @tournament.scorecards.skins_total

        payload = Leaderboards::SetPositions.new.by_scores(leaderboards, 'total')
        payload = merge_money(payload)

        render json: payload
      end

      private
      def merge_money(payload)
        p money = @tournament.skins_moneys.total_leaderboard.as_json

        [payload.as_json, money].flatten(1).group_by { |x| x['user_id'] }
          .map do |x|
            x[1][0].merge(x[1][1])
          end
      end

      def set_tournament
        @tournament = Tournament.find(params[:tournament_id])
      end

    end
  end
end