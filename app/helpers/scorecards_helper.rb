module ScorecardsHelper

  def current_tournament
    Tournament.find(params[:id])
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

  def total_gross_score(scorecard)
    @total = scorecard.user_scores.sum(:score)
    scorecard.update(total_score: @total)
    @total
  end

  def total_net_score(scorecard)
    @net = scorecard.user_scores.sum(:net)
    scorecard.update(total_net: @net)
    @net
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
