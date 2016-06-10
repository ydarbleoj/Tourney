module TournamentsHelper

	def history
		@tournaments = Tournaments.all
	end

  def skins_tournament
    @tournament = Tournament.find(params[:id])
    @tournament
  end

  def net_skins_tournament
    @tournament = Tournament.find(params[:id])
    @tournament
  end

  def skins_users
    @tournament.scorecards.map { |scorecard| scorecard.user }
  end

  def update_scorecard_skins_total
    sc = @tournament.scorecards

    sc.each do |scorecard|
      skins = scorecard.user_scores.where.not(skin: false).count
      net_skins = scorecard.user_scores.where.not(net_skin: false).count
      # if (skins > 0) || (net_skins > 0)
        scorecard.update_attributes(gross_skin_total: skins, net_skin_total: net_skins)
      # end
    end

  end

  def gross_skins_leaderboard
    @tournament.scorecards.order(gross_skin_total: :desc)
  end

  def net_skins_leaderboard
    @tournament.scorecards.order(net_skin_total: :desc)
  end

  def current_scorecard
    tr = @tournament.tournament_rounds.first
    current_user.scorecards.where(tournament_round_id: tr.id).first
  end

  def skins_won(scorecard, type)
    skin = type.to_sym
    score = type != 'net_skin' ? :score : :net
    scores = scorecard.user_scores.where.not(skin => false).select(:number, score) #.join(', ')
    scores.map { |x| "#{x.number} (#{x[score]})" }.join(', ')
  end

  def winning_score(scorecard, type)
    score = type.to_sym
    scorecard.user_scores.where.not(skin => false).pluck(score).join(', ')
  end

end
