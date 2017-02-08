class LoadCourses

  def self.load(course_name)
    course = Course.where(name: course_name).first
    p new_course = NewCourse.where(
        name: course.name,
        slope: course.slope,
        rating: course.rating,
        tee: course.tee,
        state: course.state,
        city: course.city,
        par: course.par
      ).first_or_create

    (1..18).each do |x|
      new_course.holes.create(
          number: x,
          par: course.send("h#{x}_par"),
          yards: course.send("h#{x}_yds"),
          handicap: course.send("h#{x}_hcap")
        )
    end
  end
end