class Info::MoneyList::PreviewsController  < ApplicationController
  before_action :authenticate_user
  before_action :set_tournament

  def index
    money_list = Tournament.where(id: params[:tournament_id])
      .includes(:stroke_moneys, :putting_moneys, :skins_moneys, :team_moneys, :users)
      .map do |x|
        x.users.map do |t|
            stroke = t.stroke_moneys.exists? ? t.stroke_moneys.first.money : 0
            putting = t.putting_moneys.exists? ? t.putting_moneys.first.money : 0
            skins = t.skins_moneys.exists? ? t.skins_moneys.first.total : 0
            team = t.team_moneys.exists? ? t.team_moneys.first.total: 0
            total = (stroke + putting + skins + team)
          {
            user: t.username,
            user_id: t.id,
            total: total
          }
        end
      end.flatten(1)

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

end
