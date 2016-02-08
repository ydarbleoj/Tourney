module UsersHelper

	def lowest_gross
    @low_gross = @user.rounds.where.not(score: nil).order(score: :asc).limit(1).first
    @course = Course.find(@low_gross.course_id)
  end
end
