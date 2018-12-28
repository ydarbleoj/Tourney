class GreensInReg

  def self.call(leaderboards)
    new(leaderboards).call
  end

  def initialize(leaderboards)
    @leaderboards = leaderboards
  end

  def call
    return if leaderboards.blank?
    leaderboards.each { |lb| map_scorecards(lb) }
  end

  private
  attr_reader :leaderboards

  def map_scorecards(leaderboard)
    leaderboard.scorecards.each do |scorecard|
      total = gnr_total(scorecard.user_scores)
      percent = gnr_percentage(total)
      leaderboard.send("rnd#{scorecard.round_num}_gnr=", percent)
    end
  end

  def gnr_total(user_scores)
    user_scores.map { |x| ((x.score - x.par) - (x.putts - 2)) == 0 ? 1 : 0 }.reduce(:+)
  end

  def gnr_percentage(total)
    ((total.to_f / 18) * 100).round
  end
end