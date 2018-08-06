module Leaderboards
  module Skins
    class PreviewsController  < ApplicationController
      before_action :authenticate_user
      before_action :set_tournament

      def index
        p 'SKINS'
        leaderboards = @tournament.scorecards.skins_preview

        if check_user.blank?
          player = nil
        else
          player = current_user.scorecards.user_skins(@tournament.id, current_user).first
        end

        payload = preview_with_player(leaderboards, player)
        payload = merge_money(payload)

        render json: payload
      end


      private
      def check_user
        @tournament.skins_moneys.where(user_id: current_user.id)
      end

      def preview_with_player(leaderboards, player)
        player_id = player.blank? ? nil : player[:user_id]
        inc = leaderboards.any? { |x| x[:user_id] == player_id }
        lbs = Leaderboards::SetPositions.new.by_scores(leaderboards, 'total')

        if inc == true || player_id.blank?
          lbs
        else
          player = find_player_position(player)
          lbs << player
        end
      end

      def find_player_position(player)
        new_player = {}
        totals = @tournament.scorecards.skins_preview_total

        pos = 0
        totals.each do |x|
          pos = pos == 0 ? 1 : pos
          new_player = player.merge({pos: pos}) if player[:total] == x.first
          pos += x.length
        end
        new_player
      end

      def merge_money(payload)
        p 'merge money'
        user_ids = payload.map { |x| x[:user_id] }
        money = @tournament.skins_moneys.preview_leaderboard(user_ids).as_json

        [payload.as_json, money].flatten(1).group_by { |x| x['user_id'] }
          .map do |x|
            if x[1][1].present?
              x[1][0].merge(x[1][1])
            else
              x[1][0]
            end
          end
      end

      def set_tournament
        @tournament = Tournament.find(params[:tournament_id])
      end

    end
  end
end