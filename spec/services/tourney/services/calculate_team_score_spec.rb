# frozen_string_literal: true

require "rails_helper"

RSpec.describe Tourney::Services::CalculateTeamScore do
  include_context "Tournament"
  include_context "Foursome"

  before do
    @hole1 = @course1.holes.first
    @score1 = FactoryGirl.create(
      :user_score,
      :scorecard => @scorecard1,
      :hole      => @hole1,
      :par       => @hole1.par,
      :number    => @hole1.number,
      :score     => 4
    )

    @score2 = FactoryGirl.create(
      :user_score,
      :scorecard => @scorecard2,
      :hole      => @hole1,
      :par       => @hole1.par,
      :number    => @hole1.number,
      :score     => 5
    )
    # @user_score_3 = FactoryGirl.create(
    #   :user_score,
    #   :scorecard => @scorecard_3,
    #   :hole      => @course_1.holes.find_by(:number => 1),
    #   :par       => @course_1.holes.find_by(:number => 1).par,
    #   :net       => 5,
    #   :score     => 5
    # )

    # @user_score_4 = FactoryGirl.create(
    #   :user_score,
    #   :scorecard => @scorecard_4,
    #   :hole      => @course_1.holes.find_by(:number => 1),
    #   :par       => @course_1.holes.find_by(:number => 1).par,
    #   :net       => 4,
    #   :score     => 5
    # )
  end

  def team_score_entity
    Tourney::Entities::Team::Score.new(
      :id        => @team_score.id,
      :team_id   => @team.id,
      :number    => @team_score.number,
      :net       => @team_score.net,
      :par       => @team_score.par,
      :score1_id => @team_score.score_1_id,
      :score2_id => @team_score.score_2_id,
      :score1    => @team_score.score1_net,
      :score2    => @team_score.score2_net
    )
  end

  describe "new scores" do
    context "first score added" do
      before do
        @team_score = FactoryGirl.build(
          :team_score,
          :team   => @team,
          :number => @score1.number,
          :par    => @score1.par
        )
      end

      it "returns score1" do
        @calculate_team_score = described_class.new(team_score_entity, @score1)

        expect(@calculate_team_score.net).to eq(4)
        expect(@calculate_team_score.score1_id).to eq(@score1.id)
        expect(@calculate_team_score.score2_id).to be_nil
        expect(@calculate_team_score.update?).to be_truthy
      end
    end

    context "second score added" do
      before do
        @team_score = FactoryGirl.create(
          :team_score,
          :team       => @team,
          :number     => @score1.number,
          :par        => @score1.par,
          :score_1_id => @score1.id,
          :net        => @score1.net
        )
      end

      it "returns score2" do
        @calculate_team_score = described_class.new(
          team_score_entity, @score2
        )

        expect(@calculate_team_score.net).to eq(9)
        expect(@calculate_team_score.score1_id).to eq(@score1.id)
        expect(@calculate_team_score.score2_id).to eq(@score2.id)
        expect(@calculate_team_score.update?).to be_truthy
      end
    end
  end
end
