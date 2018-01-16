class PuttingLeaderboardController  < ApplicationController
  before_action :authenticate_user
  before_action :set_tournament

  def index
    payload = @tournament.leaderboards.putting
    payload = set_position(payload)
    render json: payload
  end

  private
  def set_position(scores)
    new_payload = []
    payload = scores.group_by { |x| x[:total_putts] }.sort.map { |x| x[1] }
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