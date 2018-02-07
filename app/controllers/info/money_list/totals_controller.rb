class Info::MoneyList::TotalsController < ApplicationController
  before_action :authenticate_user
  before_action :set_tournament

  def index
    p 'MONEY'
    team    = teams
    skin    = skins
    stroke  = strokes
    putting = puttings

   money_list = [teams, skins, stroke, putting].flatten(1)
      .group_by { |x| x[:username] }.map { |t| build_hash(t[1]) }

    payload = set_position(money_list)
    render json: payload
  end

  private
  def teams
    @tournament.team_moneys.includes(:user).map { |x| { user_id: x.user.id, username: x.user.first_name + ' ' + x.user.last_name.first, team: x.total } }
  end

  def skins
    @tournament.skins_moneys.includes(:user).map { |x| { user_id: x.user.id, username: x.user.first_name + ' ' + x.user.last_name.first, skins: x.total } }
  end

  def strokes
    @tournament.stroke_moneys.includes(:user).map { |x| { user_id: x.user.id, username: x.user.first_name + ' ' + x.user.last_name.first, stroke: x.money } }
  end

  def puttings
    @tournament.putting_moneys.includes(:user).map { |x| { user_id: x.user.id, username: x.user.first_name + ' ' + x.user.last_name.first, putting: x.money } }
  end
  def build_hash(arr)
    hsh = arr[0]
    arr[1..-1].each do |t|
      hsh.merge!(t)
    end
    hsh.merge!(sum_total(hsh))
  end

  def sum_total(hsh)
    team    = hsh[:team].blank? ? 0 : hsh[:team]
    stroke  = hsh[:stroke].blank? ? 0 : hsh[:stroke]
    skins   = hsh[:skins].blank? ? 0 : hsh[:skins]
    putting = hsh[:putting].blank? ? 0 : hsh[:putting]
    { total: (team + stroke + skins + putting) }
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

  def set_tournament
    @tournament = Tournament.find(params[:tournament_id])
  end

end
