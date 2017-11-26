class Leaderboards::Skins::TotalsController  < ApplicationController
  before_action :authenticate_user
  before_action :set_tournament

  def index
    p "skins"
    leaderboards = @tournament.scorecards.skins_total
    payload = set_position(leaderboards)

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

  def set_tournament
    @tournament = Tournament.find(params[:tournament_id])
  end

end
