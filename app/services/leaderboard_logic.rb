class LeaderboardLogic

	def initialize(tournament)
		@tourn = tournament
		@holes = 1..18
	end

	def execute
		rnd1_calculation
		rnd2_calculation
		rnd3_calculation
	end

	def rnd1_calculation
		@rnd1 = @tourn.rounds.where(round_num: 1)

		@rnd1.each do |r|
			leaderboard = @tourn.leaderboards.where(user_id: r.user_id).first
			@rnd1_course = Course.where("id = ?", r.course.id)
			player_handicap = r.handicap.nil?.! ? r.handicap : 0

			shots = add_shots(r)
			shots = shots.select { |x| x if x != nil }.map { |x| x }
			score = shots.compact.inject(0) { |sum, x| sum + x }

			c = course_par(shots.length, @rnd1_course)

			c_hcap = course_handicap(@rnd1_course)
			hcap = handicaped_holes(player_handicap, c_hcap, shots.length)
			score = score != 0 ? score - hcap : 0

			leaderboard.update(
				handicap: player_handicap,
				user_id: r.user_id,
				rnd1_score: score,
				total_score: score - c,
				net_total: score)
		end
	end

	def rnd2_calculation
		@rnd2 = @tourn.rounds.where(round_num: 2)

		@rnd2.each do |r|
			if r.s1.nil?.!
				leaderboard = @tourn.leaderboards.where(user_id: r.user_id).first
				@rnd2_course = Course.where("id = ?", r.course.id)
		    player_handicap = r.handicap.nil?.! ? r.handicap : 0

		    shots = add_shots(r)
		    shots = shots.select { |x| x if x != nil }.map { |x| x }
				score = shots.compact.inject(0) { |sum, x| sum + x }

		    c = course_par(shots.length, @rnd2_course)

		    c_hcap = course_handicap(@rnd2_course)
		    hcap = handicaped_holes(player_handicap, c_hcap, shots.length)
		    score = score != 0 ? score - hcap : 0
		    net = leaderboard.rnd1_score + score
		    total_score = (leaderboard.rnd1_score - @rnd1_course[0].par) + (score - c)

				leaderboard.update(
					user_id: r.user_id,
					rnd2_score: score,
					total_score: total_score,
					net_total: net)
			end
		end
	end

	def rnd3_calculation
		rounds = @tourn.rounds.where(round_num: 3)

		rounds.each do |r|
			if r.s1.nil?.!
				leaderboard = @tourn.leaderboards.where(user_id: r.user_id).first
				@rnd3_course = Course.where("id = ?", r.course.id)
	      player_handicap = r.handicap.nil?.! ? r.handicap : 0

	      shots = add_shots(r)
	      shots = shots.select { |x| x if x != nil }.map { |x| x }
				score = shots.compact.inject(0) { |sum, x| sum + x }

	      c = course_par(shots.length, @rnd3_course)

	      c_hcap = course_handicap(@rnd3_course)
	      hcap = handicaped_holes(player_handicap, c_hcap, shots.length)
	      score = score != 0 ? score - hcap : 0
	      net = (leaderboard.rnd1_score + leaderboard.rnd2_score) + score
	      total_score = (leaderboard.rnd1_score - @rnd1_course[0].par) + (leaderboard.rnd2_score - @rnd2_course[0].par) + (score - c)

				leaderboard.update(
					user_id: r.user_id,
					rnd3_score: score,
					total_score: total_score,
					net_total: net)
			end
		end
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
