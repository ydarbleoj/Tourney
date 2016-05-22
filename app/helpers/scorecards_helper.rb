module ScorecardsHelper



  def out_par(scorecard)
    scorecard.new_course.holes.where('number < ?', 10).sum(:par)
  end

  def in_par(scorecard)
    scorecard.new_course.holes.where('number > ?', 9).sum(:par)
  end



end