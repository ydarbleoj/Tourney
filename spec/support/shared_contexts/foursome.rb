# frozen_string_literal: true

RSpec.shared_context "Foursome" do
  include_context "Tournament"

  before do
    @player2 = FactoryGirl.create(:user)
    @player3 = FactoryGirl.create(:user)
    @player4 = FactoryGirl.create(:user)

    @leaderboard2 = FactoryGirl.create(
      :leaderboard,
      :tournament => @tournament,
      :user       => @player2
    )
    @leaderboard3 = FactoryGirl.create(
      :leaderboard,
      :tournament => @tournament,
      :user       => @player3
    )
    @leaderboard4 = FactoryGirl.create(
      :leaderboard,
      :tournament => @tournament,
      :user       => @player4
    )

    @tournament.users << @player2
    @tournament.users << @player3
    @tournament.users << @player4

    @scorecard1 = FactoryGirl.create(
      :scorecard,
      :tournament_round => @round1,
      :leaderboard      => @leaderboard1,
      :new_course       => @course1,
      :user             => @player1
    )
    @scorecard2 = FactoryGirl.create(
      :scorecard,
      :tournament_round => @round1,
      :leaderboard      => @leaderboard2,
      :new_course       => @course1,
      :user             => @player2
    )
    @scorecard3 = FactoryGirl.create(
      :scorecard,
      :tournament_round => @round1,
      :leaderboard      => @leaderboard3,
      :new_course       => @course1,
      :user             => @player3
    )
    @scorecard4 = FactoryGirl.create(
      :scorecard,
      :tournament_round => @round1,
      :leaderboard      => @leaderboard4,
      :new_course       => @course1,
      :user             => @player4
    )

    @team = FactoryGirl.create(
      :team,
      :new_course       => @course1,
      :tournament_round => @round1
    )

    @team_card1 = FactoryGirl.create(
      :team_card,
      :scorecard => @scorecard1,
      :team      => @team,
      :position  => 1
    )
    @team_card2 = FactoryGirl.create(
      :team_card,
      :scorecard => @scorecard2,
      :team      => @team,
      :position  => 2
    )
    @team_card3 = FactoryGirl.create(
      :team_card,
      :scorecard => @scorecard3,
      :team      => @team,
      :position  => 3
    )
    @team_card4 = FactoryGirl.create(
      :team_card,
      :scorecard => @scorecard4,
      :team      => @team,
      :position  => 4
    )
  end
end
