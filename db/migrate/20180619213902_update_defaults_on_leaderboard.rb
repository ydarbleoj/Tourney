class UpdateDefaultsOnLeaderboard < ActiveRecord::Migration[5.1]
  def change
    change_column_default :leaderboards, :rnd1_score, 0
    change_column_default :leaderboards, :rnd2_score, 0
    change_column_default :leaderboards, :rnd3_score, 0
    change_column_default :leaderboards, :rnd1_putts, 0
    change_column_default :leaderboards, :rnd2_putts, 0
    change_column_default :leaderboards, :rnd3_putts, 0
    change_column_default :leaderboards, :total_score, 0
    change_column_default :leaderboards, :total_putts, 0
    change_column_default :leaderboards, :total_3_putts, 0
    change_column_default :leaderboards, :rn1_3putts, 0
    change_column_default :leaderboards, :rnd2_3putts, 0
    change_column_default :leaderboards, :rnd3_3putts, 0
    change_column_default :leaderboards, :net_total, 0
    change_column_default :leaderboards, :handicap, 0
  end
end
