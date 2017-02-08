module  UserScoresHelper

  def score_select
    ['did not play', 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12].each { |x| [x]}
  end

  def putt_select
    [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
  end
end