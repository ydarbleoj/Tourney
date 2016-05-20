module TournamentsHelper

	def history
		@tournaments = Tournaments.all
	end

  def skins_tournament
    @tournament = Tournament.find(params[:id])
    p skins('net')
    p skins('score')
    @tournament
  end

  def skins_users
    @tournament.scorecards.map { |scorecard| scorecard.user }
  end

  def skins(net_or_score)
    query = net_or_score.to_sym
    tr = @tournament.tournament_rounds.first

    (1..18).each do |hole|
      scores = tr.user_scores.where(number: hole).group(query, :id).order(query => :asc).pluck(:id, query)
      group = scores.group_by { |x| x[1] }.map { |x| x[1] }

      if group[0].length > 1
        false
      else
        skin = net_or_score == 'score' ? 'skin'.to_sym : 'net_skin'.to_sym
        user_id = group[0].flatten.first
        us = UserScore.find(user_id)
        us.update(skin => true)
      end
    end
    update_scorecard_skins_total
  end

  def update_scorecard_skins_total
    sc = @tournament.scorecards

    sc.each do |scorecard|
      skins = scorecard.user_scores.where.not(skin: false).count
      net_skins = scorecard.user_scores.where.not(net_skin: false).count
      scorecard.update_attributes(gross_skin_total: skins, net_skin_total: net_skins)
    end
  end

  def gross_skins_leaderboard
    @tournament.scorecards.order(gross_skin_total: :desc)
  end

  def net_skins_leaderboard
    @tournament.scorecards.order(net_skin_total: :desc)
  end

end
