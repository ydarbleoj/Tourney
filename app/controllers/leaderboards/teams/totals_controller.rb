class Leaderboards::Teams::TotalsController  < ApplicationController
  before_action :authenticate_user
  before_action :set_tournament

  def index
    p 'team'
    p payload = (1..@rounds).map { |x| map_rounds(x) }


    render json: payload
  end


  private
  def set_tournament
    @tournament = Tournament.find(params[:tournament_id])
    @rounds     = @tournament.num_rounds
  end

  def map_rounds(num)
    rounds = @tournament.tournament_rounds.where(round_number: num).first
      .team_scorecards.includes(:users, :team_scores).order(total_net: :desc)
      .map do |x|
        {
          round: num,
          group: x.group,
          total_net: x.total_net,
          players: x.users.map(&:username),
          scorecard: x.team_scores.map { |x| { hole: x.number, net: x.net, par: x.par }},
          is_won: x.is_won == true ? 1 : 0
        }
      end
    set_position(rounds)
  end

  def set_position(rounds)
    new_payload = []
    arr = rounds.group_by { |x| [x[:is_won], x[:total_net]] }.map { |x| x[1] }.reverse
    pos = 0
    arr.each do |x|
      pos = pos == 0 ? 1 : pos
      new_payload << x.map { |x| x.merge({pos: pos}) }
      pos += x.length
    end
    new_payload.flatten(1)
  end
end
