require 'rails_helper'

RSpec.describe Scorecard, :type => :model do
  scorecard = FactoryGirl.create(:scorecard, :test_setup)
  user_score  = scorecard.user_scores.last
  scorecard.update(finished: false)

  it 'has a valid factory' do
    expect(scorecard).to be_valid
  end

  context "when user updates scores" do
    describe "#total_user_scores" do
      it "should update finished to true" do
        finished = scorecard.played_eighteen?
        if finished
          scorecard.update_columns(finished: true)
          expect(scorecard.finished).to eq(true)
        else
          expect(scorecard.finished).to eq(false)
        end
      end

      it "should update attributes" do
        total_score  = scorecard.total_score
        total_putts  = scorecard.total_putts
        total_net    = scorecard.total_net
        # total_3putts = scorecard.total_3putt

        scorecard.update_columns(total_score: total_score + 1, total_putts: total_putts + 1, total_net: total_net + 1)

        expect(scorecard.total_score).to eq(total_score + 1)
        expect(scorecard.total_putts).to eq(total_putts + 1)
        expect(scorecard.total_net).to eq(total_net + 1)
      end
    end
  end
end
