require 'rails_helper'

RSpec.describe UserCourseAgg, type: :model do
  let(:user1) { create(:user, handicap: 9) }
  let(:user2) { create(:user, handicap: 12) }
  let(:course) { create(:new_course, name: "The Course #{rand(1..99)}") }
  let(:hole1) { create(:hole, new_course_id: course.id, par: 4, handicap: 4, number: 1) }
  let(:hole2) { create(:hole, new_course_id: course.id, par: 4, handicap: 7, number: 3) }
  let(:hole3) { create(:hole, new_course_id: course.id, par: 5, handicap: 8, number: 2) }
  let(:hole4) { create(:hole, new_course_id: course.id, par: 5, handicap: 9, number: 4) }

  let(:tournament1) { create(:tournament) }
  let(:tournament2) { create(:tournament) }
  let(:tournament3) { create(:tournament) }

  let(:tourn_round1) { create(:tournament_round, new_course_id: course.id, round_number: 1, tournament_id: tournament1.id) }
  let(:tourn_round2) { create(:tournament_round, new_course_id: course.id, round_number: 2, tournament_id: tournament2.id) }
  let(:tourn_round3) { create(:tournament_round, new_course_id: course.id, round_number: 3, tournament_id: tournament3.id) }
  let(:leaderboard1) { create(:leaderboard, tournament_id: tournament1.id, user_id: user1.id, handicap: user1.handicap) }
  let(:leaderboard2) { create(:leaderboard, tournament_id: tournament2.id, user_id: user1.id, handicap: user1.handicap) }
  let(:leaderboard3) { create(:leaderboard, tournament_id: tournament3.id, user_id: user1.id, handicap: user1.handicap) }


  describe 'scorecard averages' do
    it "should return correct avg" do
      create(:scorecard, leaderboard_id: leaderboard1.id, user_id: user1.id, tournament_round_id: tourn_round1.id,
        total_score: 88, total_putts: 30, total_3putts: 2, new_course_id: course.id, total_net: 79, handicap: user1.handicap,
        round_num: 1, finished: true)
      create(:scorecard, leaderboard_id: leaderboard2.id, user_id: user1.id, tournament_round_id: tourn_round2.id,
        total_score: 83, total_putts: 29, total_3putts: 1, new_course_id: course.id, total_net: 74, handicap: user1.handicap,
        round_num: 2, finished: true)


      agg = UserCourseAgg.create(new_course_id: course.id, user_id: user1.id)

      aa = agg.scorecard_averages(course.id)
      aa = aa[0].attributes

      expect(aa['count']).to eq(2)
      expect(aa['net_avg'].to_f.round(1)).to eq(76.5)
      expect(aa['gross_avg'].to_f.round(1)).to eq(85.5)
      expect(aa['putts_avg'].to_f.round(1)).to eq(29.5)
      expect(aa['three_putts_avg'].to_f.round(1)).to eq(1.5)
    end
  end

  describe 'hole averages' do
    it "should return correct avgs" do
      course_agg = UserCourseAgg.create(new_course_id: course.id, user_id: user1.id)
      UserHoleAgg.create(user_course_agg_id: course_agg.id, hole_id: hole1.id, par: hole1.par, net_avg: 3.5, gross_avg: 4.5, putts_avg: 2.1)
      UserHoleAgg.create(user_course_agg_id: course_agg.id, hole_id: hole2.id, par: hole2.par, net_avg: 4.2, gross_avg: 5.2, putts_avg: 1.9)
      UserHoleAgg.create(user_course_agg_id: course_agg.id, hole_id: hole3.id, par: hole3.par, net_avg: 5.2, gross_avg: 6.2, putts_avg: 3.1)
      UserHoleAgg.create(user_course_agg_id: course_agg.id, hole_id: hole4.id, par: hole4.par, net_avg: 4.4, gross_avg: 5.4, putts_avg: 1.5)

      agg = UserCourseAgg.find(course_agg.id)
      arg = agg.hole_par_avgs

      expect(arg[4].to_f.round(1)).to eq(3.9)
      expect(arg[5].to_f.round(1)).to eq(4.8)
    end
  end

  it "should return hardest and easiest hole" do
    course_agg = UserCourseAgg.create(new_course_id: course.id, user_id: user1.id)
    UserHoleAgg.create(user_course_agg_id: course_agg.id, hole_id: hole1.id, par: hole1.par, net_avg: 3.5, gross_avg: 4.5, putts_avg: 2.1)
    UserHoleAgg.create(user_course_agg_id: course_agg.id, hole_id: hole2.id, par: hole2.par, net_avg: 4.2, gross_avg: 5.2, putts_avg: 1.9)
    UserHoleAgg.create(user_course_agg_id: course_agg.id, hole_id: hole3.id, par: hole3.par, net_avg: 5.2, gross_avg: 6.2, putts_avg: 3.1)
    UserHoleAgg.create(user_course_agg_id: course_agg.id, hole_id: hole4.id, par: hole4.par, net_avg: 4.4, gross_avg: 5.4, putts_avg: 1.5)

    holes = course_agg.hole_diffculty
  end
end
