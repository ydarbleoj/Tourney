class Leaderboards::Skins::PreviewsController  < ApplicationController
  before_action :authenticate_user
  before_action :set_tournament

  def index
    p "skins"
    p leaderboards = @tournament.scorecards.skins_preview
    payload = preview_with_player(leaderboards, current_user)

    render json: payload
  end


  private
  def preview_with_player(leaderboards, player)
    player_id = player[:user_id]
    inc = leaderboards.any? { |x| x[:user_id] == player_id }
    if inc == true
      set_position(leaderboards)
    else
      leaderboards = set_position(leaderboards)
      player = find_player_position(player)
      leaderboards << player
    end
  end

  def set_position(scores)
    new_payload = []
    payload = scores.group_by { |x| x[:total] }.sort.map { |x| x[1] }.reverse
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
    scores = @tournament.scorecards.pluck(:total)
      .sort.group_by { |x| x }.map { |x| x[1] }
    pos = 0
    scores.each do |x|
      pos = pos == 0 ? 1 : pos
      new_player = player.merge({pos: pos}) if player[:total] == x.first
      pos += x.length
    end
    new_player
  end

  def set_tournament
    @tournament = Tournament.find(params[:tournament_id])
  end

end
