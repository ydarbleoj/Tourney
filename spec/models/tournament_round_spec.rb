require 'rails_helper'

RSpec.describe TournamentRound, :type => :model do
  before(:all) do
    @tournament = create(:tournament)
    @course     = create(:new_course)
    @round      = create(:tournament_round, tournament_id: @tournament.id, new_course_id: @course.id)
    @user       = create(:user, handicap: 8)
    @course_agg = create(:course_agg, new_course_id: @course.id)
    @round_agg  = create(:round_agg, tournament_round_id: @round.id)
    @user_course_aggs = create(:user_course_agg, new_course_id: @course.id, user_id: @user.id)
    @tourn_round = TournamentRound.course_data(@round.id, @user.id)
  end

  describe 'course data' do
    it "should return course agg" do
      course = @tourn_round.course_aggs.first
      expect(course.par3_avg.to_f).to eq(3.5)
      expect(course.par4_avg.to_f).to eq(5.0)
      expect(course.par5_avg.to_f).to eq(5.5)
      expect(course.gross_avg.to_f).to eq(94.5)
      expect(course.net_avg.to_f).to eq(85.5)
      expect(course.putts_avg.to_f).to eq(36.5)
      expect(course.three_putts_avg.to_f).to eq(3.5)
      expect(course.greens_in_reg.to_f).to eq(5.5)
    end

    it "should return round agg" do
      round = @tourn_round.round_aggs.first
      expect(round.par3_avg.to_f).to eq(3.2)
      expect(round.par4_avg.to_f).to eq(4.7)
      expect(round.par5_avg.to_f).to eq(5.5)
      expect(round.gross_avg.to_f).to eq(90.5)
      expect(round.net_avg.to_f).to eq(80.5)
      expect(round.putts_avg.to_f).to eq(34.5)
      expect(round.three_putts_avg.to_f).to eq(2.5)
    end

  end


end
