require 'rails_helper'

RSpec.describe PlayerBuild do
  before(:each) do
   @tournament = create(:tournament, end_date: DateTime.new(2019, 01, 13), start_date: DateTime.new(2019, 01, 11))
   @course1 = create(:new_course, name: 'Course1')
   @course2 = create(:new_course, name: 'Course2')
   @course3 = create(:new_course, name: 'Course3')
   @course4 = create(:new_course, name: 'Course4')
   @tr1     = create(:tournament_round, new_course_id: @course1.id, tournament_id: @tournament.id, round_number: 1, round_date: DateTime.now)
   @tr2     = create(:tournament_round, new_course_id: @course2.id, tournament_id: @tournament.id, round_number: 2, round_date: DateTime.now)
   @tr3     = create(:tournament_round, new_course_id: @course3.id, tournament_id: @tournament.id, round_number: 3, round_date: DateTime.now)
   @user    = create(:user)
  end

  it "should return a creaated tournament with rounds" do
    PlayerBuild.call(@tournament, @user, 'admin')

    expect(SkinsMoney.where(user_id: @user.id, tournament_id: @tournament.id)).to exist
    expect(PuttingMoney.where(user_id: @user.id, tournament_id: @tournament.id)).to exist
    expect(StrokeMoney.where(user_id: @user.id, tournament_id: @tournament.id)).to exist
    expect(TeamMoney.where(user_id: @user.id, tournament_id: @tournament.id)).to exist
    expect(Scorecard.where(user_id: @user.id, tournament_round_id: @tr1.id)).to exist
    expect(Scorecard.where(user_id: @user.id, tournament_round_id: @tr2.id)).to exist
    expect(Scorecard.where(user_id: @user.id, tournament_round_id: @tr3.id)).to exist
    expect(@tournament.users.first.id).to eq(@user.id)
    expect(@tournament.tournament_users.first.role).to eq('admin')
    expect(Leaderboard.where(user_id: @user.id, tournament_id: @tournament.id)).to exist

  end


end