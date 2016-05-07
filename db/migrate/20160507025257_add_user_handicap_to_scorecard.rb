class AddUserHandicapToScorecard < ActiveRecord::Migration
  def change
    add_reference :scorecards, :user, index: true, foreign_key: true
  end
end
