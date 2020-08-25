# frozen_string_literal: true

require "rails_helper"

RSpec.describe Tourney::Services::TeamScoring do
  include_context "Tournament"

  before do
    @player_2 = FactoryGirl.create(:user)
    @player_3 = FactoryGirl.create(:user)
    @player_4 = FactoryGirl.create(:user)

    @leaderboard_2 = FactoryGirl.create(
      :leaderboard,
      :tournament => @tournament,
      :user       => @player_2
    )
    @leaderboard_3 = FactoryGirl.create(
      :leaderboard,
      :tournament => @tournament,
      :user       => @player_3
    )
    @leaderboard_4 = FactoryGirl.create(
      :leaderboard,
      :tournament => @tournament,
      :user       => @player_4
    )

    @tournament.users << @player_2
    @tournament.users << @player_3
    @tournament.users << @player_4

    @scorecard_1 = FactoryGirl.create(
      :scorecard,
      :tournament_round => @round_1,
      :leaderboard      => @leaderboard_1,
      :new_course       => @course_1,
      :user             => @player_1
    )
    @scorecard_2 = FactoryGirl.create(
      :scorecard,
      :tournament_round => @round_1,
      :leaderboard      => @leaderboard_2,
      :new_course       => @course_1,
      :user             => @player_2
    )
    @scorecard_3 = FactoryGirl.create(
      :scorecard,
      :tournament_round => @round_1,
      :leaderboard      => @leaderboard_3,
      :new_course       => @course_1,
      :user             => @player_3
    )
    @scorecard_4 = FactoryGirl.create(
      :scorecard,
      :tournament_round => @round_1,
      :leaderboard      => @leaderboard_4,
      :new_course       => @course_1,
      :user             => @player_4
    )

    @team = FactoryGirl.create(
      :team,
      :new_course       => @course_1,
      :tournament_round => @round_1
    )

    @team.scorecards << @scorecard_1
    @team.scorecards << @scorecard_2
    @team.scorecards << @scorecard_3
    @team.scorecards << @scorecard_4

    @user_score_1 = FactoryGirl.create(
      :user_score,
      :scorecard => @scorecard_1,
      :hole      => @course_1.holes.find_by(:number => 1),
      :par       => @course_1.holes.find_by(:number => 1).par
    )

    @user_score_2 = FactoryGirl.create(
      :user_score,
      :scorecard => @scorecard_2,
      :hole      => @course_1.holes.find_by(:number => 1),
      :par       => @course_1.holes.find_by(:number => 1).par,
      :net       => 5,
      :score     => 5
    )
    @user_score_3 = FactoryGirl.create(
      :user_score,
      :scorecard => @scorecard_3,
      :hole      => @course_1.holes.find_by(:number => 1),
      :par       => @course_1.holes.find_by(:number => 1).par,
      :net       => 5,
      :score     => 5
    )

    @user_score_4 = FactoryGirl.create(
      :user_score,
      :scorecard => @scorecard_4,
      :hole      => @course_1.holes.find_by(:number => 1),
      :par       => @course_1.holes.find_by(:number => 1).par,
      :net       => 4,
      :score     => 5
    )
  end

  describe "#execute" do
    context "new score" do
      before do
        klass = described_class.new(@user_score_1)
        klass.execute
      end

      it "creates a new score" do
        team_score = @team.reload.team_scores.find_by(:number => 1)

        expect(@team.team_scores.count).to eq(1)
        expect(team_score).to be_present
        expect(team_score.par).to eq(4)
        expect(team_score.number).to eq(1)
        expect(team_score.net).to eq(4)
        expect(team_score.score_1_id).to eq(@user_score_1.id)
        expect(team_score.score_2_id).to be_nil
        expect(@team.total_net).to eq(4)
      end
    end

    context "second score" do
      before do
        @team_score = FactoryGirl.create(
          :team_score,
          :team_id    => @team.id,
          :par        => 4,
          :number     => 1,
          :net        => 4,
          :score_1_id => @user_score_1.id,
          :score_2_id => nil
        )
        @team.update(:total_net => 4)
        klass = described_class.new(@user_score_2)
        klass.execute
      end

      it "adds a new score" do
        expect(@team.reload.team_scores.count).to eq(1)
        expect(@team_score.reload).to be_present
        expect(@team_score.par).to eq(4)
        expect(@team_score.number).to eq(1)
        expect(@team_score.net).to eq(9)
        expect(@team_score.score_1_id).to eq(@user_score_1.id)
        expect(@team_score.score_2_id).to eq(@user_score_2.id)
        expect(@team.total_net).to eq(9)
      end
    end

    context "third score" do
      before do
        @team_score = FactoryGirl.create(
          :team_score,
          :team_id    => @team.id,
          :par        => 4,
          :number     => 1,
          :net        => 9,
          :score_1_id => @user_score_1.id,
          :score_2_id => @user_score_2.id
        )
        @team.update(:total_net => 9)
        klass = described_class.new(@user_score_3)
        klass.execute
      end

      it "doesn't update anything" do
        expect(@team.reload.team_scores.count).to eq(1)
        expect(@team_score.reload.par).to eq(4)
        expect(@team_score.number).to eq(1)
        expect(@team_score.net).to eq(9)
        expect(@team_score.score_1_id).to eq(@user_score_1.id)
        expect(@team_score.score_2_id).to eq(@user_score_2.id)
        expect(@team.total_net).to eq(9)
      end
    end

    context "fourth score" do
      before do
        @team_score = FactoryGirl.create(
          :team_score,
          :team_id    => @team.id,
          :par        => 4,
          :number     => 1,
          :net        => 9,
          :score_1_id => @user_score_1.id,
          :score_2_id => @user_score_2.id
        )
        @team.update(:total_net => 9)
        klass = described_class.new(@user_score_4)
        klass.execute
      end

      it "updates team score and team total" do
        expect(@team.reload.team_scores.count).to eq(1)
        expect(team_score.reload.par).to eq(4)
        expect(team_score.number).to eq(1)
        expect(team_score.net).to eq(9)
        expect(team_score.score_1_id).to eq(@user_score_1.id)
        expect(team_score.score_2_id).to eq(@user_score_2.id)

        expect(@team.total_net).to eq(8)
      end
    end
  end
end
