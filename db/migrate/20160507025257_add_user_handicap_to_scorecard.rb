class AddUserHandicapToScorecard < ActiveRecord::Migration[5.1]
  def change
    add_reference :scorecards, :user, index: true, foreign_key: true
  end
end
