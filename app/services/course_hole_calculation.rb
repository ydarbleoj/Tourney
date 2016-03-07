class CourseHoleCalculation

	def initialize(course_id)
		@course_id = course_id
		@course = Course.where("id = ?", @course_id)
	end

	def execute
		average_holes
		compare_holes
		sorted_holes
	end

	def hardest_hole
		execute
		hardest_hole = @sorted.pop
		hole = hardest_hole[0].to_s.split('_').first
		score = instance_variable_get("@hole#{hole.split('h')[1]}")
		par = @course[0]["#{hole}_par"]
		number = hole.split('h')[1]
	  [number, par, score.round(1)]
	end

	def easiest_hole
		execute
		easiest_hole = @sorted.shift
		hole = easiest_hole[0].to_s.split('_').first
		score = instance_variable_get("@hole#{hole.split('h')[1]}")
		par = @course[0]["#{hole}_par"]
		number = hole.split('h')[1]
		if number.nil?.!
			return [number, par, score]
		end
	end

	def avg_score
		Round.where.not(score: :nil).where("course_id = ?", @course_id).average(%q{score - handicap})
	end

	def avg_putts
		Round.where("course_id = ?", @course_id).average(:putts)
	end

	def fewest_putts
		fewest_putts = Round.where.not(score: :nil).where("course_id = ?", @course_id).order(putts: :asc).first
		if fewest_putts.nil?.!
		  return [fewest_putts.user.username, fewest_putts.putts]
		else
			fewest_putts = nil
		end
	end

	def lowest_round
		lowest_round = Round.where.not(score: :nil).where("course_id = ?", @course_id).order(%q{score - handicap}).first
		if lowest_round.nil?.!
		  return [lowest_round.user.username, lowest_round.score - lowest_round.handicap]
		else
			return nil
		end
	end

	def average_holes
		@hole1 = Round.where("course_id = ?", @course_id).average(:s1).to_f.round(2)
		@hole2 = Round.where("course_id = ?", @course_id).average(:s2).to_f.round(2)
		@hole3 = Round.where("course_id = ?", @course_id).average(:s3).to_f.round(2)
		@hole4 = Round.where("course_id = ?", @course_id).average(:s4).to_f.round(2)
		@hole5 = Round.where("course_id = ?", @course_id).average(:s5).to_f.round(2)
		@hole6 = Round.where("course_id = ?", @course_id).average(:s6).to_f.round(2)
		@hole7 = Round.where("course_id = ?", @course_id).average(:s7).to_f.round(2)
		@hole8 = Round.where("course_id = ?", @course_id).average(:s8).to_f.round(2)
		@hole9 = Round.where("course_id = ?", @course_id).average(:s9).to_f.round(2)
		@hole10 = Round.where("course_id = ?", @course_id).average(:s10).to_f.round(2)
		@hole11 = Round.where("course_id = ?", @course_id).average(:s11).to_f.round(2)
		@hole12 = Round.where("course_id = ?", @course_id).average(:s12).to_f.round(2)
		@hole13 = Round.where("course_id = ?", @course_id).average(:s13).to_f.round(2)
		@hole14 = Round.where("course_id = ?", @course_id).average(:s14).to_f.round(2)
		@hole15 = Round.where("course_id = ?", @course_id).average(:s15).to_f.round(2)
		@hole16 = Round.where("course_id = ?", @course_id).average(:s16).to_f.round(2)
		@hole17 = Round.where("course_id = ?", @course_id).average(:s17).to_f.round(2)
		@hole18 = Round.where("course_id = ?", @course_id).average(:s18).to_f.round(2)
	end

	def compare_holes
		@compared_holes = {
			h1_diff: @hole1 - @course[0].h1_par,
			h2_diff: @hole2 - @course[0].h2_par,
			h3_diff: @hole3 - @course[0].h3_par,
			h4_diff: @hole4 - @course[0].h4_par,
			h5_diff: @hole5 - @course[0].h5_par,
			h6_diff: @hole6 - @course[0].h6_par,
			h7_diff: @hole7 - @course[0].h7_par,
			h8_diff: @hole8 - @course[0].h8_par,
			h9_diff: @hole9 - @course[0].h9_par,
			h10_diff: @hole10 - @course[0].h10_par,
			h11_diff: @hole11 - @course[0].h11_par,
			h12_diff: @hole12 - @course[0].h12_par,
			h13_diff: @hole13 - @course[0].h13_par,
			h14_diff: @hole14 - @course[0].h14_par,
			h15_diff: @hole15 - @course[0].h15_par,
			h16_diff: @hole16 - @course[0].h16_par,
			h17_diff: @hole17 - @course[0].h17_par,
			h18_diff: @hole18 - @course[0].h18_par }
		@compared_holes
	end

	def sorted_holes
		@sorted = @compared_holes.sort_by {|k,v| v }
	end


end