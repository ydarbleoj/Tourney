class Info::OverallStats::PreviewsController  < ApplicationController
  before_action :authenticate_user
  before_action :set_tournament

  def index

    payload = preview_with_player(money_list).flatten(1)
    render json: payload
  end

  private
  def hardest_course
    @hardest_course = @tournament.scorecards.group('new_courses.name')
      .select('new_courses.name, AVG(total_net) AS avg')
      .order('avg desc').first.as_json
  end

  def hardest_hole

  end

  def tournament_avg
    @tourn_avg = @tournament.scorecards.select('AVG(total_net) AS avg_score')
      .as_json[0]['avg_score'].to_f.round(2)
  end


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

   def set_tournament
    @tournament = Tournament.find(params[:tournament_id])
    @round_ids  = @tournament.tournament_rounds.pluck(:id)
  end
end
