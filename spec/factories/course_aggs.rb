FactoryGirl.define do
  factory :course_agg do
    new_course
    gross_avg { 94.5 }
    net_avg { 85.5 }
    putts_avg { 36.5 }
    three_putts_avg { 3.5 }
    greens_in_reg { 5.5 }
    par3_avg { 3.5 }
    par4_avg { 5.0 }
    par5_avg { 5.5 }
    easiest_hole { '4 (par 4) - 4.5 avg' }
    hardest_hole { '17 (par 3) - 4.2 avg' }
    lowest_round { 'Jim John - 71' }
    highest_round { 'Smithington Smither - 154' }
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
