FactoryGirl.define do
  factory :scorecard do
    tournament_round
    total_score 0
    total_putts 0
    total_3putts 0
    total_net 0
    net_skin_total 0
    gross_skin_total 0
  end

   # scorecard handicap will be 5
   # total_score: 81, total_putts: 37, total_3putts: 1, total_net: 76
  trait :low_scores do
    after :create do |scorecard|
      course = scorecard.new_course
      course.holes.each do |hole|
        par = hole.par
        putts = hole.handicap > 1 ? 2 : 3
        score = hole.handicap > 9 ? par : par + 1
        FactoryGirl.create(:user_score, scorecard_id: scorecard.id, number: hole.number, hole_id: hole.id, score: score, putts: putts)
      end
    end
  end
  # scorecard handicap will be 15
  # total_score: 90, total_putts: 38, total_3putts: 2, total_net: 75
  trait :mid_scores do
    after :create do |scorecard|
      course = scorecard.new_course
      course.holes.each do |hole|
        par = hole.par
        putts = hole.handicap >= 3 ? 2 : 3
        FactoryGirl.create(:user_score, scorecard_id: scorecard.id, number: hole.number, hole_id: hole.id, score: par + 1, putts: putts)
      end
    end
  end
  # scorecard handicap will be 25
  # # total_score: 108, total_putts: 41, total_3putts: 5, total_net: 83
  trait :high_scores do
    after :create do |scorecard|
      course = scorecard.new_course
      course.holes.each do |hole|
        par = hole.par
        putts = hole.handicap >= 6 ? 2 : 3
        FactoryGirl.create(:user_score, scorecard_id: scorecard.id, number: hole.number, hole_id: hole.id, score: par + 2, putts: putts)
      end
    end
  end
end
