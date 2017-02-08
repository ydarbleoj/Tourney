class UserStatisticsController < ApplicationController
  before_action :authenticate_user!

  def show
    p @sc = current_user.scorecards.finished

    return if @sc.blank?

    lowest_round
    scoring_avg
    putting_avg
    fewest_putts
    par_three_avg
    par_four_avg
    par_five_avg

  end

  def lowest_round
   p @lowest_round = current_user.scorecards.finished
      .joins(:new_course).order(total_net: :asc)
      .select('scorecards.total_net, scorecards.tournament_round_id, new_courses.name').first
    @round_date = TournamentRound.find(@lowest_round.tournament_round_id).round_date
  end

  def scoring_avg
    @net_scoring_avg = current_user.scorecards.finished.average(:total_net)
    @gross_scoring_avg = current_user.scorecards.finished.average(:total_score)
  end

  def fewest_putts
    @fewest_putts = current_user.scorecards.finished
    .joins(:new_course).order(total_putts: :asc)
    .select('scorecards.total_putts, scorecards.tournament_round_id, new_courses.name').first
    @putt_date = TournamentRound.find(@lowest_round.tournament_round_id).round_date
  end

  def putting_avg
    @putting_avg = current_user.scorecards.finished.average(:total_putts)
    @three_putt_avg = current_user.scorecards.finished.average(:total_3putts)
  end

  def par_three_avg
    @par3_avg = current_user.scorecards.finished
      .joins(:user_scores)
      .where('user_scores.par = ?', 3).average(:net).round(1)
  end

  def par_four_avg
    @par4_avg = current_user.scorecards.finished
      .joins(:user_scores)
      .where('user_scores.par = ?', 4).average(:net).round(1)
  end

  def par_five_avg
    @par5_avg = current_user.scorecards.finished
      .joins(:user_scores)
      .where('user_scores.par = ?', 5).average(:net).round(1)
  end

  def best_tournament

  end


end