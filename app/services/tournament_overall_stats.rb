class TournamentOverallStats

	def initialize(tournament, type)
    @tournament  = tournament
    @scorecards  = tournament.scorecards.includes(:user_scores, :user, :new_course)
    @total_cards = (@scorecards.size + 0.0)
    @type        = type
	end

	def execute
    t_avg = tournament_avg
    l_rnd = lowest_round
    h_crs = hardest_course
    e_crs = easiest_course
    f_pts = fewest_putts
    a_pts = avg_putts


    if @type == 'preview'
      { tourn_avg: t_avg, lowest_round: l_rnd, hardest_course: h_crs, easiest_course: e_crs, fewest_putts: f_pts, avg_putts: a_pts }
    else
      p 'here'
    end
	end

	def tournament_avg
    avg_scores(@scorecards, 'total_net')
	end

	def lowest_round
    card = @scorecards.sort_by(&:total_net).first
    user = card.user
    { username: user.first_name + ' ' + user.last_name.first, handicap: card.handicap, total_net: card.total_net}
	end

	def hardest_course
    card = @scorecards.group_by { |x| x[:new_course_id] }.map { |x| [x[1][0].new_course, avg_scores_courses(x[1], 'total_net')] }
    course = card.sort_by { |x| x[1] }.last
    { course: course[0].name, par: course[0].par, avg: course[1] }
	end

  def easiest_course
    card = @scorecards.group_by { |x| x[:new_course_id] }.map { |x| [x[1][0].new_course, avg_scores_courses(x[1], 'total_net')] }
    course = card.sort_by { |x| x[1] }.first
    { course: course[0].name, par: course[0].par, avg: course[1] }
  end

  def fewest_putts
    card = @scorecards.sort_by(&:total_putts).first
    user = card.user
    { username: user.first_name + ' ' + user.last_name.first, course: card.new_course.name, total_putts: card.total_putts }
  end

  def avg_putts
    avg_scores(@scorecards, 'total_putts')
  end

  def hardest_hole
    @user_scores.group_by { |x| x[:new_course_id] }
  end

  def avg_scores(arr, obj)
    len = @total_cards
    (arr.inject(0) { |sum, t| sum + t[obj.to_sym] } / len).round(2)
  end

  def avg_scores_courses(arr, obj)
    len = arr.size + 0.0
    (arr.inject(0) { |sum, t| sum + t[obj.to_sym] } / len).round(2)
  end

end