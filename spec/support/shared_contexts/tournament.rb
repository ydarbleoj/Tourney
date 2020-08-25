# frozen_string_literal: true

RSpec.shared_context "Tournament" do
  before :all do
    @tournament = FactoryGirl.create(:tournament)

    @round_1 = FactoryGirl.create(
      :tournament_round,
      :tournament => @tournament,
      :new_course => FactoryGirl.create(
        :new_course,
        :bandon_dunes
      )
    )
    @course_1 = @round_1.new_course

    @round_2 = FactoryGirl.create(
      :tournament_round,
      :tournament   => @tournament,
      :round_number => 2,
      :new_course   => FactoryGirl.create(
        :new_course,
        :pacific_dunes
      )
    )
    @course_2 = @round_2.new_course

    @round_3 = FactoryGirl.create(
      :tournament_round,
      :tournament   => @tournament,
      :round_number => 3,
      :new_course   => FactoryGirl.create(
        :new_course,
        :old_mac
      )
    )
    @course_3 = @round_3

    @player_1 = FactoryGirl.create(:user)
    @leaderboard_1 = FactoryGirl.create(
      :leaderboard,
      :tournament => @tournament,
      :user       => @player_1
    )
    @tournament.users << @player_1
  end
end
