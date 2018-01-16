class Info::MoneyList::TotalsController  < ApplicationController
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
            stroke: stroke,
            putting: putting,
            skins: skins,
            team: team,
            total: total
          }
        end
      end.flatten(1)

    payload = set_position(money_list)
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

end
