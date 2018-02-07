class Leaderboards::StrokePreviewsController  < ApplicationController
  before_action :authenticate_user
  before_action :set_tournament

  def index
    leaderboards = @tournament.leaderboards.stroke_top_five
    player = current_user.leaderboards.user_preview_stroke(@tournament.id)

    payload = preview_with_player(leaderboards, player)
    render json: payload
  end

  private
  def check_user
    @tournament.stroke_moneys.where(user_id: current_user.id)
  end

  def preview_with_player(leaderboards, player)
    player_id = player.blank? ? nil : player[:user_id]
    inc = leaderboards.any? { |x| x[:user_id] == player_id }
    if inc == true || player_id.blank?
      set_position(leaderboards)
    else
      leaderboards = set_position(leaderboards)
      player = find_player_position(player)
      leaderboards << player
    end
  end

  def set_position(scores)
    new_payload = []
    payload = scores.group_by { |x| x[:total_score] }.sort.map { |x| x[1] }
    pos = 0
    payload.each do |x|
      pos = pos == 0 ? 1 : pos
      new_payload << x.map { |x| x.merge({pos: pos}) }
      pos += x.length
    end
    new_payload.flatten(1)
  end

  def find_player_position(player)
    new_player = {}
    scores = @tournament.leaderboards.pluck(:total_score)
      .sort.group_by { |x| x }.map { |x| x[1] }
    pos = 0
    scores.each do |x|
      pos = pos == 0 ? 1 : pos
      new_player = player.merge({pos: pos}) if player[:total_score] == x.first
      pos += x.length
    end
    new_player
  end

  def set_tournament
    @tournament = Tournament.find(params[:tournament_id])
  end

end
