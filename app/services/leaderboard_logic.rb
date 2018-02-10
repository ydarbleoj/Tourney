class LeaderboardLogic

	def initialize(scorecard)
    @scorecard   = scorecard
    @course      = scorecard.new_course
    @tourn_rnd   = scorecard.tournament_round
    @tournament  = @tourn_rnd.tournament
    @lb          = Leaderboard.where(user_id: scorecard.user_id, tournament_id: @tournament.id).first
    @user_scores = scorecard.user_scores
  end

  def execute
    p "Leaderboard LOGIC"
    scores = @scorecard.user_scores.exists?
    return if scores.blank?

    # Round specific scores
    @net_score   = @user_scores.map(&:net).inject(0, :+)
    @putts       = @user_scores.map(&:putts).inject(0, :+)
    @three_putts = @user_scores.map { |x| x.putts if x.putts > 2 }.compact.length

    # Leaderboard totals
    @course_par = holes_played
    @ttl_score  = total_scores
    p "now"
    @ttl_putts  = total_putts
    p 'here2'
    @ttl_3putts = total_3putts
    p 'here3'
    @net_total  = net_totals

  p  data        = set_round_data.merge(total_setup)

    Leaderboard.transaction do
     p @lb.update_attributes(data)
    end
  end

  def total_setup
    { total_score: @ttl_score, net_total: @net_total, total_putts: @ttl_putts, total_3_putts: @ttl_3putts }
  end

  def set_round_data
    case @tourn_rnd.round_number
    when 1
      round_one
    when 2
      round_two
    when 3
      round_three
    else
      nil
    end
  end

  def holes_played
    if @scorecard.finished
      @course.par
    else
      holes_played = @user_scores.map(&:number)
      @course.holes.where(number: holes_played).sum(:par)
    end
  end

  def total_scores
    total_score = []
   p current_round = @net_score - @course_par
   p rnds = (1..@tournament.num_rounds).to_a - [@tourn_rnd.round_number]
   p 'HERE'
    total_score << current_round

    rnds.each do |round|
     p rnd = "rnd#{round}_score"
    p  score = @lb.send(rnd)
      if score == 0
        total_score << 0
      else
      p  course = @tournament.tournament_rounds.where(round_number: round).first.new_course.par
        p arr = score - course
        total_score << arr
      end
    end
    total_score.inject(0, :+)
  end

  def net_totals
    total = []
    rnds = (1..@tournament.num_rounds).to_a - [@tourn_rnd.round_number]
    total << @net_score

    rnds.each do |round|
      rnd = "rnd#{round}_score"
      total << @lb.send(rnd)
    end
    total.inject(0, :+)
  end

  def total_putts
    total = []
    rnds = (1..@tournament.num_rounds).to_a - [@tourn_rnd.round_number]
    total << @putts

    rnds.each do |round|
      rnd = "rnd#{round}_putts"
      total << @lb.send(rnd)
    end
    total.inject(0, :+)
  end

  def total_3putts
    total = []
    rnds = (1..@tournament.num_rounds).to_a - [@tourn_rnd.round_number]
    total << @three_putts

    rnds.each do |round|
      rnd = round == 1 ? "rn#{round}_3putts" : "rnd#{round}_3putts"
      total << @lb.send(rnd)
    end
    total.inject(0, :+)
  end

  def round_one
    { rnd1_score: @net_score, rnd1_putts: @putts, rn1_3putts: @three_putts }
  end

  def round_two
    { rnd2_score: @net_score, rnd2_putts: @putts, rnd2_3putts: @three_putts }
  end

  def round_three
    { rnd3_score: @net_score, rnd3_putts: @putts, rnd3_3putts: @three_putts }
  end

end
