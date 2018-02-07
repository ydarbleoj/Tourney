class Leaderboards::Skins::PreviewsController  < ApplicationController
  before_action :authenticate_user
  before_action :set_tournament

  def index
    p 'SKINS'
    p leaderboards = @tournament.scorecards.skins_preview

    p player = current_user.scorecards.user_skins(@tournament.id, current_user).first


   p  payload = preview_with_player(leaderboards, player)
    payload = merge_money(payload)

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
    scores = @tournament.skins_moneys.pluck(:total)
      .sort.group_by { |x| x }.map { |x| x[1] }.reverse
    pos = 0
    scores.each do |x|
      pos = pos == 0 ? 1 : pos
      new_player = player.merge({pos: pos}) if player[:total] == x.first
      pos += x.length
    end
    new_player
  end

  def merge_money(payload)
    p 'merge money'
    user_ids = payload.map { |x| x[:user_id] }
    money = @tournament.skins_moneys.where(user_id: user_ids).skins_won.as_json

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
