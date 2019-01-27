class UpdateScorecardDefaults < ActiveRecord::Migration[5.1]
  def change
    change_column_default :scorecards, :total_score, 0
    change_column_default :scorecards, :total_putts, 0
    change_column_default :scorecards, :total_3putts, 0
    change_column_default :scorecards, :total_net, 0
    change_column_default :scorecards, :net_skin_total, 0
    change_column_default :scorecards, :gross_skin_total, 0
    change_column_default :scorecards, :handicap, 0
  end
end
