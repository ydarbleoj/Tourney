class LeaderboardLogic

	def initialize(tournament, scorecard, player)
		@tournament = tournament
    @scorecard  = scorecard
		@holes = 1..18
    @leaderboard = @tournament.leaderboards.where(user_id: player.id).first
  end

  def round_one
    @round_one = @tournament.tournament_rounds.find_by_round_number(1)
    @course = @round_one.new_course
    @user_scores = @scorecard.user_scores

    holes_played = @user_scores.map(&:number)
    course_par = @course.holes.where(number: holes_played).sum(:par)

    net_score = @user_scores.map(&:net).inject(0, :+)
    putts = @user_scores.map(&:putts).inject(0, :+)
    three_putts = @user_scores.map { |x| p x.putts if x.putts > 2 }.compact.length


    @leaderboard.update_attributes(
        handicap: @scorecard.handicap,
        rnd1_score: net_score,
        total_score: net_score - course_par,
        net_total: net_score,
        rnd1_putts: putts,
        rn1_3putts: three_putts,
        total_putts: putts,
        total_3_putts: three_putts)
  end

  def round_two
    @round_two = @tournament.tournament_rounds.find_by_round_number(2)
    @course = @round_two.new_course
    @user_scores = @scorecard.user_scores

    holes_played = @user_scores.map(&:number)
    course_par = @course.holes.where(number: holes_played).sum(:par)

    net_score = @user_scores.map(&:net).inject(0, :+)
    putts = @user_scores.map(&:putts).inject(0, :+)
    three_putts = @user_scores.map { |x| p x.putts if x.putts > 2 }.compact.length

    round_one_total = @leaderboard.rnd1_score - @tournament.tournament_rounds.find_by_round_number(1).new_course.par

    @leaderboard.update_attributes(
        rnd2_score: net_score,
        total_score: (round_one_total + (net_score - course_par)),
        net_total: @leaderboard.rnd1_score + net_score,
        rnd2_putts: putts,
        rnd2_3putts: three_putts,
        total_putts: @leaderboard.rnd1_putts + putts,
        total_3_putts: @leaderboard.rn1_3putts + three_putts)
  end

  def round_three
    @round_three = @tournament.tournament_rounds.find_by_round_number(3)
    @course = @round_three.new_course
    @user_scores = @scorecard.user_scores

    holes_played = @user_scores.map(&:number)
    course_par = @course.holes.where(number: holes_played).sum(:par)

    net_score = @user_scores.map(&:net).inject(0, :+)
    putts = @user_scores.map(&:putts).inject(0, :+)
    three_putts = @user_scores.map { |x| p x.putts if x.putts > 2 }.compact.length

    round_one_total = @leaderboard.rnd1_score - @tournament.tournament_rounds.find_by_round_number(1).new_course.par
    round_two_total = @leaderboard.rnd2_score - @tournament.tournament_rounds.find_by_round_number(2).new_course.par


    @leaderboard.update_attributes(
        rnd3_score: net_score,
        total_score: ((round_one_total + round_two_total) + (net_score - course_par)),
        net_total: net_score,
        rnd3_putts: putts,
        rnd3_3putts: three_putts,
        total_putts: @leaderboard.rnd1_putts + @leaderboard.rnd2_putts + putts,
        total_3_putts: @leaderboard.rn1_3putts + @leaderboard.rnd2_3putts + three_putts)
  end

  def course_par(holes_played, course)
    par = []
    h = holes_played

    course.each do |c|
      @holes.each do |i|
        par << c["h#{i}_par"]
      end
    end
    par = par[0, holes_played].compact.inject(0) { |sum, x| sum + x }
  end

  def handicaped_holes(player_handicap, course_hcaps, holes_played)
  	hcap_holes, hcap_total, high_total = [], [], []

  	if player_handicap < 19
	  	course_hcaps.each_with_index do |value, index|
	  		value <= player_handicap ? hcap_holes << index + 1 : nil
	  	end
	  	hcap_holes.each { |x| hcap_total << x if x <= holes_played }
			high_total = hcap_total.length
	  elsif player_handicap >= 19
	  	new_cap = player_handicap - 18
	  	course_hcaps.each_with_index do |value, index|
	  		if (value <= new_cap) && (index + 1 <= holes_played)
	  			hcap_total << index + 1
	  		end
			end
	  	one = holes_played - hcap_total.length
	  	high_total = (hcap_total.length * 2) + one
  	end
		high_total
  end

  def course_handicap(course)
  	course_hcap = []
  	@holes.each do |i|
	  	course.each { |c| course_hcap << c["h#{i}_hcap"]  }
	  end
	  course_hcap
  end

  def add_shots(rnd)
  	r = []
  	@holes.each { |i| r << rnd["s#{i}"] }
  	r
  end
#
end
