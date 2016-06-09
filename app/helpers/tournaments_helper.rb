module TournamentsHelper

	def history
		@tournaments = Tournaments.all
	end

  def skins_tournament
    @tournament = Tournament.find(params[:id])
    skins('score')
    @tournament
  end

  def net_skins_tournament
    @tournament = Tournament.find(params[:id])
    skins('net')
    @tournament
  end

  def skins_users
    @tournament.scorecards.map { |scorecard| scorecard.user }
  end

  def skins(net_or_score)
    query = net_or_score.to_sym
    tr = @tournament.tournament_rounds.first
    skin = net_or_score == 'score' ? 'skin'.to_sym : 'net_skin'.to_sym

    (1..18).each do |hole|

      # p "NUMBER : #{hole}"
      current_skin = tr.user_scores.where(number: hole).where(skin => true).pluck(:id, query)
      current_low_score = current_skin.blank?.! ? current_skin[0][1] : []
      new_low_score = tr.user_scores.where(number: hole).minimum(query)
      users_with_lowest_score = tr.user_scores.where(number: hole).where(query => new_low_score).pluck(:id, query)
      # p "CURRENT SKIN : #{current_skin}"
      # p "USER #{users_with_lowest_score}"

      if current_skin.blank? && users_with_lowest_score.length > 1
        p "NO WINNER #{users_with_lowest_score}"
      end

      if current_skin.blank? && users_with_lowest_score.length == 1
        # p "FIRST WIN #{users_with_lowest_score[0]}"
        new_skin = UserScore.find(users_with_lowest_score[0][0])
        new_skin.update(skin => true)
      end

      if current_skin.blank?.! && users_with_lowest_score.length == 1
        if current_low_score == new_low_score
        # p "LOW SCORE #{current_low_score} : #{new_low_score}"
        p "WINNER #{current_skin}"
        elsif current_low_score > new_low_score
          # p "NEW WINNER #{users_with_lowest_score[0][0]}"
          new_skin = UserScore.find(users_with_lowest_score[0][0])
          new_skin.update(skin => true)

          old_skin = UserScore.find(current_skin[0][0])
          old_skin.update(skin => false)
        end
      end

      if current_skin.blank?.! && users_with_lowest_score.length > 1
        if current_low_score == users_with_lowest_score[0][1] || current_low_score > users_with_lowest_score[0][1]
          # p "USERS #{users_with_lowest_score}"
          remove_skin = UserScore.find(current_skin.flatten[0])
          # p "REMOVE #{remove_skin.id}"
          remove_skin.update(skin => false)
        end
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
