class PuttingLeaderboardCalculations

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
			r1_p = []

			@holes.each do |i|
			  r1_p << r["p#{i}"]
		  end
		  r1_putts = r1_p.compact.inject(0) {|sum, x| sum + x }
		  @rnd1_three_putts = r1_p.compact.select { |x| x if x > 2 }.map { |y| y }

			leaderboard.update(
				user_id: r.user_id,
				rnd1_putts: r1_putts,
				# rnd1_3putts: nil,
				total_3_putts: @rnd1_three_putts.length,
				total_putts: r1_putts)
		end
	end

	def rnd2_calculation
		@rnd2 = @tourn.rounds.where(round_num: 2)

		@rnd2.each do |r|
			leaderboard = @tourn.leaderboards.where(user_id: r.user_id).first
			r2_p = []

			if r.p1.nil?.!
				@holes.each do |i|
			    r2_p << r["p#{i}"]
		    end
			  r2_putts = r2_p.compact.inject(0) {|sum, x| sum + x }
			  @rnd2_three_putts = r2_p.compact.select { |x| x if x > 2 }.map { |y| y }
			  total_3_putts = (@rnd1_three_putts.length + @rnd2_three_putts.length)

				leaderboard.update(
					user_id: r.user_id,
					rnd2_putts: r2_putts,
					# rnd2_3putts: @rnd2_three_putts.length,
					total_3_putts: total_3_putts,
					total_putts: leaderboard.rnd1_putts + r2_putts)
			end
		end
	end

	def rnd3_calculation
		@rnd3 = @tourn.rounds.where(round_num: 3)

		@rnd3.each do |r|
			leaderboard = @tourn.leaderboards.where(user_id: r.user_id).first
			r3_p = []

			if r.p1.nil?.!
				@holes.each do |i|
			    r3_p << r["p#{i}"]
		    end
				r3_putts = r3_p.compact.inject(0) {|sum, x| sum + x }
			  three_putts = r3_p.compact.select { |x| x if x > 2 }.map { |y| y }
			  total_3_putts = (@rnd2_three_putts.length + @rnd1_three_putts.length) + three_putts.length
			  total_putts = (leaderboard.rnd1_putts + leaderboard.rnd2_putts) + r3_putts

				leaderboard.update(
					user_id: r.user_id,
					rnd3_putts: r3_putts,
					# rnd3_3putts: three_putts.length,
					total_3_putts: ,
					total_putts: total_putts)
			end
		end
	end


end