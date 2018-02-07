class Leaderboards::Skins::TotalsController  < ApplicationController
  before_action :authenticate_user
  before_action :set_tournament

  def index
    p leaderboards = @tournament.scorecards.skins_total

    payload = set_position(leaderboards)
    payload = merge_money(payload)

    render json: payload
  end

  private
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
