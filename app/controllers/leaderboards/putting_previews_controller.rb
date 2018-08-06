module Leaderboards
  class PuttingPreviewsController < ApplicationController
    before_action :authenticate_user
    before_action :set_tournament

    def index
      leaderboards = @tournament.leaderboards.putting_top_five

      if check_user.blank?
        player = nil
      else
        player = current_user.leaderboards.user_preview_putting(@tournament.id)
      end

      payload = preview_with_player(leaderboards, player)
      render json: payload
    end


    private
    def check_user
      @tournament.putting_moneys.where(user_id: current_user.id)
    end


    def preview_with_player(leaderboards, player)
      player_id = player.blank? ? nil : player[:user_id]
      inc = leaderboards.any? { |x| x[:user_id] == player_id }
      lbs = Leaderboards::SetPositions.new.by_scores(leaderboards, 'total_putts')

      if inc == true || player_id.blank?
        lbs
      else
        player = Leaderboards::SetPositions.new.with_player(player, @tournament, 'total_putts')
        lbs << player
      end
    end

    def set_tournament
      @tournament = Tournament.find(params[:tournament_id])
    end

  end
end
