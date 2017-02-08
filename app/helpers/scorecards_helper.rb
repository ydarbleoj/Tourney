module ScorecardsHelper

  # def current_tournament
  #   Tournament.find(params[:id])
  # end
  def linked_routes(hole_number, user_score)
    if user_score[hole_number - 1].present?
      edit_path = edit_tournament_scorecard_user_score_path(@tournament.id, @scorecard.id, @user_scores[hole_number - 1].id)
    else
      new_path = new_tournament_scorecard_user_score_path(@tournament.id, @scorecard.id, number: hole_number)
    end
  end

  def out_gross_score(scorecard)
    scorecard.user_scores.where('number < ?', 10).sum(:score)
  end

  def out_net_score(scorecard)
    scorecard.user_scores.where('number < ?', 10).sum(:net)
  end

  def in_gross_score(scorecard)
    scorecard.user_scores.where('number > ?', 9).sum(:score)
  end

  def in_net_score(scorecard)
    scorecard.user_scores.where('number > ?', 9).sum(:net)
  end

  def out_par(scorecard)
    scorecard.new_course.holes.where('number < ?', 10).sum(:par)
  end

  def in_par(scorecard)
    scorecard.new_course.holes.where('number > ?', 9).sum(:par)
  end

  def course_tee
    @scorecard.user.gender == 'M' ? 'Copper' : 'Green'
  end

  def course_slope
    @scorecard.user.gender == 'M' ? 134 : 131
  end

  def course_rating
    @scorecard.user.gender == 'M' ? 72.3 : 71.6
  end


  def total_gross_score(scorecard)
    @scorecard = scorecard
    results = @scorecard.user_scores
      .pluck('SUM(score), SUM(net), SUM(putts)').flatten(1)

    @total_score = results[0]
    @total_net   = results[1]
    @total_putts = results[2]

    scorecard.update_column(:total_score, @total_score ||= 0)
    round = scorecard.round_num

    if round == 1
      tournament = Tournament.find(scorecard.tournament_round.tournament.id)
      LeaderboardLogic.new(tournament, @scorecard, current_user).round_one
    end

    if round == 2
      tournament = Tournament.find(scorecard.tournament_round.tournament.id)
      LeaderboardLogic.new(tournament, @scorecard, current_user).round_two
    end

    if round == 3
      tournament = Tournament.find(scorecard.tournament_round.tournament.id)
      LeaderboardLogic.new(tournament, @scorecard, current_user).round_three
    end

    @total_score
  end


  def total_putts
    @scorecard.update_column(:total_putts, @total_putts ||= 0)
   p @total_putts
  end

  def three_putts(scorecard)
    putts = scorecard.user_scores.where('putts >= ?', 3).length
    scorecard.update_column(:total_3putts, putts)
    putts
  end

  def total_net_score
    @scorecard.update_column(:total_net, @total_net ||= 0)
    @total_net
  end

  def handicaped_holes(scorecard, number)
    hole_hcap = scorecard.new_course.holes.where(number: number).pluck(:handicap).first
    hcap = scorecard.handicap

    if hcap < 19
      hcap < hole_hcap ? '' : '.'
    else
      new_cap = hcap - 18
      new_cap < hole_hcap ? '.' : '..'
    end
  end

  def check_for_skin(skin)
    return 'skin-won' if skin == 'true'
  end

end
