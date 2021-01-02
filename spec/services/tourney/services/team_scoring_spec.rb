# frozen_string_literal: true

require "rails_helper"

RSpec.describe Tourney::Services::TeamScoring do
  include_context "Foursome"

  before do
    @hole1 = @course1.holes.first
    @score1 = FactoryGirl.create(
      :user_score,
      :scorecard => @scorecard1,
      :hole      => @hole1,
      :par       => @hole1.par,
      :number    => @hole1.number,
      :handicap  => @hole1.handicap,
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
    @score3 = FactoryGirl.create(
      :user_score,
      :scorecard => @scorecard3,
      :hole      => @hole1,
      :par       => @hole1.par,
      :number    => @hole1.number,
      :score     => 5
    )

    @score4 = FactoryGirl.create(
      :user_score,
      :scorecard => @scorecard4,
      :hole      => @hole1,
      :par       => @hole1.par,
      :number    => @hole1.number,
      :score     => 4
    )
  end

  describe "#execute" do
    context "new score" do
      before do
        klass = described_class.new(@score1)
        klass.execute
      end

      it "creates a new score" do
        team_score = @team.reload.team_scores.find_by(:number => 1)

        expect(@team.team_scores.count).to eq(1)
        expect(team_score).to be_present
        expect(team_score.par).to eq(4)
        expect(team_score.number).to eq(1)
        expect(team_score.net).to eq(4)
        expect(team_score.score_1_id).to eq(@score1.id)
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
          :score_1_id => @score1.id,
          :score_2_id => nil
        )
        @team.update(:total_net => 4)
        klass = described_class.new(@score2)
        klass.execute
      end

      it "adds a new score" do
        expect(@team.reload.team_scores.count).to eq(1)
        expect(@team_score.reload).to be_present
        expect(@team_score.par).to eq(4)
        expect(@team_score.number).to eq(1)
        expect(@team_score.net).to eq(9)
        expect(@team_score.score_1_id).to eq(@score1.id)
        expect(@team_score.score_2_id).to eq(@score2.id)
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
          :score_1_id => @score1.id,
          :score_2_id => @score2.id
        )
        @team.update(:total_net => 9)
        klass = described_class.new(@score3)
        klass.execute
      end

      it "doesn't update anything" do
        expect(@team.reload.team_scores.count).to eq(1)
        expect(@team_score.reload.par).to eq(4)
        expect(@team_score.number).to eq(1)
        expect(@team_score.net).to eq(9)
        expect(@team_score.score_1_id).to eq(@score1.id)
        expect(@team_score.score_2_id).to eq(@score2.id)
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
          :score_1_id => @score1.id,
          :score_2_id => @score2.id
        )
        @team.update(:total_net => 9)
        klass = described_class.new(@score4)
        klass.execute
      end

      it "updates team score and team total" do
        expect(@team.reload.team_scores.count).to eq(1)
        expect(@team_score.reload.par).to eq(4)
        expect(@team_score.number).to eq(1)
        expect(@team_score.net).to eq(8)
        expect(@team_score.score_1_id).to eq(@score1.id)
        expect(@team_score.score_2_id).to eq(@score4.id)

        expect(@team.total_net).to eq(8)
      end
    end
  end
end
