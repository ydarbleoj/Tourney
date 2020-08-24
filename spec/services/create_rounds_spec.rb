require 'rails_helper'

RSpec.describe CreateRounds do
  before(:each) do
   @tournament = create(:tournament, end_date: DateTime.new(2019, 01, 13), start_date: DateTime.new(2019, 01, 11))
   @course1 = create(:new_course, name: 'Course1')
   @course2 = create(:new_course, name: 'Course2')
   @course3 = create(:new_course, name: 'Course3')
   @course4 = create(:new_course, name: 'Course4')
   @user    = create(:user)
  end

  it "should return a creaated tournament with rounds" do
    rounds = rounds_data
    CreateRounds.call(@tournament, rounds, @user)
    tr1 = @tournament.tournament_rounds.where(round_number: 1).first
    tr2 = @tournament.tournament_rounds.where(round_number: 2).first
    tr3 = @tournament.tournament_rounds.where(round_number: 3).first

    expect(@tournament.tournament_rounds.size).to eq(3)
    expect(@tournament.users.first.id).to eq(@user.id)
    expect(@tournament.tournament_users.first.role).to eq('admin')
    expect(tr1.new_course.id).to eq(2)
    expect(tr1.round_number).to eq(1)
    expect(tr1.teams.size).to eq(4)
    expect(tr2.new_course.id).to eq(3)
    expect(tr2.round_number).to eq(2)
    expect(tr2.teams.size).to eq(4)
    expect(tr3.new_course.id).to eq(4)
    expect(tr3.round_number).to eq(3)
    expect(tr3.teams.size).to eq(4)
  end

  def rounds_data
    [{"course"=>"2", "round_number"=>1, "round_date"=>"2019-01-11T00:00:00.000+00:00", "tee_times"=>[{"groupA"=>"11:00", "groupB"=>"11:10", "groupC"=>"11:20", "groupD"=>"11:35"}]}, {"course"=>"3", "round_number"=>2, "round_date"=>"2019-01-12T00:00:00.000+00:00", "tee_times"=>[{"groupA"=>"11:04", "groupB"=>"11:20", "groupC"=>"11:30", "groupD"=>"11:40"}]}, {"course"=>"4", "round_number"=>3, "round_date"=>"2019-01-13T00:00:00.000+00:00", "tee_times"=>[{"groupA"=>"11:16", "groupB"=>"11:26", "groupC"=>"11:34", "groupD"=>"11:45"}]}]
  end
end