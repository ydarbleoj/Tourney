class CoursesController < ApplicationController
  before_filter :check_for_user

	def index
		@courses = Course.all
	end

  def show
    @course = Course.find(params[:id])
  	@hardest = CourseHoleCalculation.new(@course.id).hardest_hole
  	@easiest = CourseHoleCalculation.new(@course.id).easiest_hole
  	@avg_score = CourseHoleCalculation.new(@course.id).avg_score
  	@avg_putts = CourseHoleCalculation.new(@course.id).avg_putts
  	@fewest_putts = CourseHoleCalculation.new(@course.id).fewest_putts
  	@lowest_round = CourseHoleCalculation.new(@course.id).lowest_round
  end


end