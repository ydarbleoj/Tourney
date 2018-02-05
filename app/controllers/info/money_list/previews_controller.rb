class Info::MoneyList::PreviewsController  < ApplicationController
  before_action :authenticate_user
  before_action :set_tournament

  def index
    money_list = map_list
    money_list = set_position(money_list)
    payload = preview_with_player(money_list).flatten(1)

    render json: payload
  end

  private
  def preview_with_player(money_list)
    top_five = money_list.select { |x| x if x[:pos] < 6 }.map { |x| x }

    if top_five.any? {|x| x[:user_id] == current_user.id }
      top_five
    else
      top_five << money_list.select { |x| x if x[:user_id] == current_user.id }.map { |x| x }
    end
  end

  def map_list
    teams = @tournament.team_moneys.includes(:user).map { |x| { user_id: x.user.id, username: x.user.first_name + ' ' + x.user.last_name.first, team: x.total } }
    skins = @tournament.skins_moneys.includes(:user).map { |x| { user_id: x.user.id, username: x.user.first_name + ' ' + x.user.last_name.first, skins: x.total } }
    stroke = @tournament.stroke_moneys.includes(:user).map { |x| { user_id: x.user.id, username: x.user.first_name + ' ' + x.user.last_name.first, stroke: x.money } }
    putting = @tournament.putting_moneys.includes(:user).map { |x| { user_id: x.user.id, username: x.user.first_name + ' ' + x.user.last_name.first, putting: x.money } }

    [teams, skins, stroke, putting].flatten(1).group_by { |x| x[:username] }.map { |t| build_hash(t[1]) }
  end

  def build_hash(arr)
    hsh = arr[0]
    arr[1..-1].each do |t|
      hsh.merge!(t)
    end
    hsh.merge!(sum_total(hsh))
  end

  def sum_total(hsh)
    { total: (hsh[:team] + hsh[:stroke] + hsh[:skins] + hsh[:putting]) }
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
