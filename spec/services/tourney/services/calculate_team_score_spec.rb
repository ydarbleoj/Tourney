# frozen_string_literal: true

require "rails_helper"

RSpec.describe Tourney::Services::CalculateTeamScore do
  include_context "Foursome"

  def team_score_entity
    Tourney::Entities::Team::Score.new(
      :id         => @team_score.id,
      :team_id    => @team_score.team.id,
      :number     => @team_score.number,
      :net        => @team_score.net,
      :par        => @team_score.par,
      :score1_id  => @team_score.score_1_id,
      :score2_id  => @team_score.score_2_id,
      :score1     => @team_score.score1,
      :score2     => @team_score.score2,
      :team_size  => @team.scorecards.size,
      :next_score => @team_score.next_score
    )
  end

  def user_score_entity(user_score, position)
    Tourney::Entities::UserScore.new(
      user_score.attributes.symbolize_keys.merge(
        :position => position
      )
    )
  end

  describe "new scores" do
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
        :score     => 6
      )

      @score4 = FactoryGirl.create(
        :user_score,
        :scorecard => @scorecard4,
        :hole      => @hole1,
        :par       => @hole1.par,
        :number    => @hole1.number,
        :score     => 5
      )
    end

    context "first score added" do
      before do
        @team_score = FactoryGirl.build(
          :team_score,
          :team   => @team,
          :number => @score1.number,
          :par    => @score1.par
        )
        @calculate_team_score = described_class.new(
          team_score_entity, user_score_entity(@score1, @team_card1.position)
        )
      end

      it "returns score1" do
        expect(@calculate_team_score.net).to eq(4)
        expect(@calculate_team_score.score1_id).to eq(@score1.id)
        expect(@calculate_team_score.score2_id).to be_nil
        expect(@calculate_team_score.update?).to be_truthy
      end
    end

    describe "when the second score is added" do
      context "when it's higher than the first" do
        before do
          @team_score = FactoryGirl.create(
            :team_score,
            :team       => @team,
            :number     => @score1.number,
            :par        => @score1.par,
            :score_1_id => @score1.id,
            :net        => @score1.net
          )

          @calculate_team_score = described_class.new(
            team_score_entity, user_score_entity(@score2, @team_card2.position)
          )
        end

        it "returns score2" do
          expect(@calculate_team_score.net).to eq(9)
          expect(@calculate_team_score.score1_id).to eq(@score1.id)
          expect(@calculate_team_score.score2_id).to eq(@score2.id)
          expect(@calculate_team_score.update?).to be_truthy
        end
      end

      context "when it's lower than the first" do
        before do
          @team_score = FactoryGirl.create(
            :team_score,
            :team       => @team,
            :number     => @score1.number,
            :par        => @score1.par,
            :score_1_id => @score1.id,
            :score_2_id => nil,
            :net        => 4
          )
          @score2.update(:score => 3)
          @calculate_team_score = described_class.new(
            team_score_entity, user_score_entity(@score2.reload, @team_card2.position)
          )
        end

        it "returns demotes score1" do
          expect(@calculate_team_score.net).to eq(7)
          expect(@calculate_team_score.score1_id).to eq(@score2.id)
          expect(@calculate_team_score.score2_id).to eq(@score1.id)
          expect(@calculate_team_score.update?).to be_truthy
        end
      end
    end

    context "third score" do
      before do
        @team_score = FactoryGirl.create(
          :team_score,
          :team       => @team,
          :number     => @score1.number,
          :par        => @score1.par,
          :score_1_id => @score1.id,
          :score_2_id => @score2.id,
          :net        => 9
        )

        @calculate_team_score = described_class.new(
          team_score_entity, user_score_entity(@score3, @team_card3.position)
        )
      end

      it "doesn't update anything" do
        expect(@calculate_team_score.net).to eq(9)
        expect(@calculate_team_score.score1_id).to eq(@score1.id)
        expect(@calculate_team_score.score2_id).to eq(@score2.id)
        expect(@calculate_team_score.update?).to be_falsey
      end

      context "when score2's update is greater than the next score" do
        before do
          @team_score = FactoryGirl.create(
            :team_score,
            :team       => @team,
            :number     => @score1.number,
            :par        => @score1.par,
            :score_1_id => @score1.id,
            :score_2_id => @score2.id,
            :net        => 8
          )
          @score2.update(:score => 6)

          @calculate_team_score = described_class.new(
            team_score_entity, user_score_entity(@score2.reload, @team_card2.position)
          )
        end

        it "updates the score total" do
          expect(@calculate_team_score.net).to eq(9)
        end

        it "returns score1 unchanged" do
          expect(@calculate_team_score.score1_id).to eq(@score1.id)
        end

        it "demotes score2 and promotes score4" do
          expect(@calculate_team_score.score2_id).to eq(@score4.id)
        end
      end
    end

    context "when fourth score is added" do
      before do
        @team_score = FactoryGirl.create(
          :team_score,
          :team       => @team,
          :number     => @score1.number,
          :par        => @score1.par,
          :score_1_id => @score1.id,
          :score_2_id => @score2.id,
          :net        => 9
        )

        @calculate_team_score = described_class.new(
          team_score_entity, user_score_entity(@score4, @team_card4.position)
        )
      end

      it "noting updates" do
        expect(@calculate_team_score.net).to eq(9)
        expect(@calculate_team_score.update?).to be_falsey
        expect(@calculate_team_score.score1_id).to eq(@score1.id)
        expect(@calculate_team_score.score2_id).to eq(@score2.id)
      end
    end

    context "when fourth score updates" do
      before do
        @team_score = FactoryGirl.create(
          :team_score,
          :team       => @team,
          :number     => @score1.number,
          :par        => @score1.par,
          :score_1_id => @score1.id,
          :score_2_id => @score4.id,
          :net        => 8
        )
        @score4.update(:score => 3)

        @calculate_team_score = described_class.new(
          team_score_entity, user_score_entity(@score4.reload, @team_card4.position)
        )
      end

      it "updates the score total" do
        expect(@calculate_team_score.net).to eq(7)
      end

      it "promotes score2 to score1" do
        expect(@calculate_team_score.score1_id).to eq(@score4.id)
      end

      it "demotes score1 to score2" do
        expect(@calculate_team_score.score2_id).to eq(@score1.id)
      end
    end

    context "when score1 updates updates" do
      before do
        @team_score = FactoryGirl.create(
          :team_score,
          :team       => @team,
          :number     => @score1.number,
          :par        => @score1.par,
          :score_1_id => @score1.id,
          :score_2_id => @score2.id,
          :net        => 9
        )
        @score1.update(:score => 10)

        @calculate_team_score = described_class.new(
          team_score_entity, user_score_entity(@score1.reload, @team_card1.position)
        )
      end

      it "updates the score total" do
        expect(@calculate_team_score.net).to eq(10)
      end

      it "promotes score2 to score1" do
        expect(@calculate_team_score.score1_id).to eq(@score2.id)
      end

      it "promotes score4 to score2" do
        expect(@calculate_team_score.score2_id).to eq(@score4.id)
      end
    end
  end

  describe "threesome new scores" do
    before do
      @team_card4.delete
      @hole2 = @course1.holes.second
      @score1 = FactoryGirl.create(
        :user_score,
        :scorecard => @scorecard1,
        :hole      => @hole2,
        :par       => @hole2.par,
        :number    => @hole2.number,
        :handicap  => @hole2.handicap,
        :score     => 4
      )

      @score2 = FactoryGirl.create(
        :user_score,
        :scorecard => @scorecard2,
        :hole      => @hole2,
        :par       => @hole2.par,
        :number    => @hole2.number,
        :score     => 5
      )
      @score3 = FactoryGirl.create(
        :user_score,
        :scorecard => @scorecard3,
        :hole      => @hole2,
        :par       => @hole2.par,
        :number    => @hole2.number,
        :score     => 5
      )
    end

    context "first score added" do
      before do
        @team_score = FactoryGirl.build(
          :team_score,
          :team   => @team,
          :number => @score1.number,
          :par    => @score1.par
        )
        @calculate_team_score = described_class.new(
          team_score_entity, user_score_entity(@score1, @team_card1.position)
        )
      end

      it "returns score1" do
        expect(@calculate_team_score.net).to eq(4)
        expect(@calculate_team_score.score1_id).to eq(@score1.id)
        expect(@calculate_team_score.score2_id).to be_nil
        expect(@calculate_team_score.update?).to be_truthy
      end
    end

    describe "when the second score is added" do
      context "when it's higher than the first" do
        before do
          @team_score = FactoryGirl.create(
            :team_score,
            :team       => @team,
            :number     => @hole2.number,
            :par        => @hole2.par,
            :score_1_id => @score1.id,
            :score_2_id => nil,
            :net        => 4
          )

          @calculate_team_score = described_class.new(
            team_score_entity, user_score_entity(@score2, @team_card2.position)
          )
        end

        it "returns score2" do
          expect(@calculate_team_score.net).to eq(9)
          expect(@calculate_team_score.score1_id).to eq(@score1.id)
          expect(@calculate_team_score.score2_id).to eq(@score2.id)
          expect(@calculate_team_score.update?).to be_truthy
        end
      end

      context "when it's lower than the first" do
        before do
          @team_score = FactoryGirl.create(
            :team_score,
            :team       => @team,
            :number     => @hole2.number,
            :par        => @hole2.par,
            :score_1_id => @score1.id,
            :score_2_id => @score2.id,
            :net        => 8
          )
          @score2.update(:score => 3)

          @calculate_team_score = described_class.new(
            team_score_entity, user_score_entity(@score2.reload, @team_card2.position)
          )
        end

        it "returns demotes score1" do
          expect(@calculate_team_score.net).to eq(6)
          expect(@calculate_team_score.score1_id).to eq(@score2.id)
          expect(@calculate_team_score.score2_id).to eq(@score2.id)
          expect(@calculate_team_score.update?).to be_truthy
        end
      end
    end

    context "third score" do
      before do
        @team_score = FactoryGirl.create(
          :team_score,
          :team       => @team,
          :number     => @hole2.number,
          :par        => @hole2.par,
          :score_1_id => @score1.id,
          :score_2_id => @score2.id,
          :net        => 9
        )

        @calculate_team_score = described_class.new(
          team_score_entity, user_score_entity(@score3, @team_card3.position)
        )
      end

      it "doesn't update anything" do
        expect(@calculate_team_score.net).to eq(9)
        expect(@calculate_team_score.score1_id).to eq(@score1.id)
        expect(@calculate_team_score.score2_id).to eq(@score2.id)
        expect(@calculate_team_score.update?).to be_falsey
      end
    end
  end
end
