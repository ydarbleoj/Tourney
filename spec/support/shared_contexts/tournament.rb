# frozen_string_literal: true

RSpec.shared_context "Tournament" do
  before do
    @tournament = FactoryGirl.create(:tournament)
    @course1    = FactoryGirl.create(:new_course, :bandon_dunes)
    @course2    = FactoryGirl.create(:new_course, :pacific_dunes)
    @course3    = FactoryGirl.create(:new_course, :old_mac)

    @round1 = FactoryGirl.create(
      :tournament_round,
      :tournament => @tournament,
      :new_course => @course1
    )

    @round2 = FactoryGirl.create(
      :tournament_round,
      :tournament   => @tournament,
      :round_number => 2,
      :new_course   => @course2
    )

    @round3 = FactoryGirl.create(
      :tournament_round,
      :tournament   => @tournament,
      :round_number => 3,
      :new_course   => @course3
    )

    @player1 = FactoryGirl.create(:user)
    @leaderboard1 = FactoryGirl.create(
      :leaderboard,
      :tournament => @tournament,
      :user       => @player1
    )
    @tournament.users << @player1
  end
end
