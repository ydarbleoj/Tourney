FactoryGirl.define do
  factory :course_agg do
    new_course
  end

  trait :with_hole_aggs do
    after :create do |course|
      course.new_course.holes.each do |hole|
        FactoryGirl.create(:hole_agg, course_agg_id: course.id, hole_id: hole.id, par: hole.par,
          net_avg: hole.par - 0.3, gross_avg: hole.par + 0.7, putts_avg: 2.7, greens_in_reg: 0.26, three_putts_avg: 0.4)
      end
    end
  end

end
