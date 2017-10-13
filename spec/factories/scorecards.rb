FactoryGirl.define do
  factory :scorecard do
    total_score 0
    total_putts 0
    total_3putts 0
    total_net 0
  end

  trait :with_scores do
    after :create do |scorecard|
      course = scorecard.new_course
      (0..17).each do |i|
        FactoryGirl.create(:user_score, scorecard_id: scorecard.id, number: (i + 1), score: rand(2..8), putts: rand(0..3), handicap: scorecard.handicap, par: course.holes[i])
      end
      total_score = scorecard.user_scores.sum(:score)
      total_putts = scorecard.user_scores.sum(:putts)
      total_net   = scorecard.user_scores.sum(:net)
      total_3putts = scorecard.user_scores.where('putts > ?', 2).size
      scorecard.update(total_score: total_score, total_putts: total_putts, total_net: total_net, total_3putts: total_3putts)
    end
  end
end
