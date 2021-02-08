# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_02_08_213700) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "course_aggs", force: :cascade do |t|
    t.bigint "new_course_id"
    t.decimal "gross_avg"
    t.decimal "net_avg"
    t.decimal "putts_avg"
    t.decimal "three_putts_avg"
    t.decimal "greens_in_reg"
    t.decimal "par3_avg"
    t.decimal "par4_avg"
    t.decimal "par5_avg"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "easiest_hole_id"
    t.bigint "hardest_hole_id"
    t.bigint "lowest_round_id"
    t.decimal "hcap_diff", precision: 3, scale: 1, default: "0.0", null: false
  end

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.decimal "rating"
    t.integer "slope"
    t.integer "par"
    t.string "tee"
    t.string "city"
    t.string "state"
    t.integer "yardage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "h1_yds"
    t.integer "h2_yds"
    t.integer "h3_yds"
    t.integer "h4_yds"
    t.integer "h5_yds"
    t.integer "h6_yds"
    t.integer "h7_yds"
    t.integer "h8_yds"
    t.integer "h9_yds"
    t.integer "h10_yds"
    t.integer "h11_yds"
    t.integer "h12_yds"
    t.integer "h13_yds"
    t.integer "h14_yds"
    t.integer "h15_yds"
    t.integer "h16_yds"
    t.integer "h17_yds"
    t.integer "h18_yds"
    t.integer "h1_par"
    t.integer "h2_par"
    t.integer "h3_par"
    t.integer "h4_par"
    t.integer "h5_par"
    t.integer "h6_par"
    t.integer "h7_par"
    t.integer "h8_par"
    t.integer "h9_par"
    t.integer "h10_par"
    t.integer "h11_par"
    t.integer "h12_par"
    t.integer "h13_par"
    t.integer "h14_par"
    t.integer "h15_par"
    t.integer "h16_par"
    t.integer "h17_par"
    t.integer "h18_par"
    t.integer "h1_hcap"
    t.integer "h2_hcap"
    t.integer "h3_hcap"
    t.integer "h4_hcap"
    t.integer "h5_hcap"
    t.integer "h6_hcap"
    t.integer "h7_hcap"
    t.integer "h8_hcap"
    t.integer "h9_hcap"
    t.integer "h10_hcap"
    t.integer "h11_hcap"
    t.integer "h12_hcap"
    t.integer "h13_hcap"
    t.integer "h14_hcap"
    t.integer "h15_hcap"
    t.integer "h16_hcap"
    t.integer "h17_hcap"
    t.integer "h18_hcap"
    t.integer "out_yds"
    t.integer "in_yds"
    t.integer "out_par"
    t.integer "in_par"
  end

  create_table "hole_aggs", force: :cascade do |t|
    t.bigint "course_agg_id"
    t.bigint "hole_id"
    t.decimal "net_avg"
    t.decimal "gross_avg"
    t.decimal "putts_avg"
    t.decimal "three_putts_avg"
    t.integer "count"
    t.decimal "greens_in_reg"
    t.integer "par"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "holes", force: :cascade do |t|
    t.integer "number"
    t.integer "par"
    t.integer "yards"
    t.integer "handicap"
    t.bigint "new_course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["new_course_id"], name: "index_holes_on_new_course_id"
  end

  create_table "invitations", force: :cascade do |t|
    t.string "email"
    t.integer "tournament_id"
    t.string "token"
    t.string "first_name"
    t.string "last_name"
    t.boolean "accepted", default: false
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "leaderboard_scorecards", force: :cascade do |t|
    t.integer "leaderboard_id"
    t.integer "scorecard_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "leaderboards", force: :cascade do |t|
    t.integer "total_score", default: 0
    t.integer "total_putts", default: 0
    t.integer "total_3_putts", default: 0
    t.integer "net_total", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "tournament_id"
    t.bigint "user_id"
    t.integer "handicap", default: 0
    t.boolean "dnf", default: false
    t.index ["tournament_id"], name: "index_leaderboards_on_tournament_id"
    t.index ["user_id"], name: "index_leaderboards_on_user_id"
  end

  create_table "new_courses", force: :cascade do |t|
    t.string "name"
    t.integer "slope"
    t.integer "rating"
    t.string "tee"
    t.string "state"
    t.string "city"
    t.integer "par"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "yardage"
  end

  create_table "putting_moneys", force: :cascade do |t|
    t.integer "tournament_id"
    t.integer "user_id"
    t.integer "position"
    t.integer "money", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "round_aggs", force: :cascade do |t|
    t.decimal "par3_avg", default: "0.0"
    t.decimal "par4_avg", default: "0.0"
    t.decimal "par5_avg", default: "0.0"
    t.decimal "net_avg", default: "0.0"
    t.decimal "putts_avg", default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "tournament_round_id"
    t.integer "count", default: 0
    t.decimal "gross_avg", default: "0.0"
    t.decimal "three_putts_avg", precision: 3, scale: 1, default: "0.0", null: false
    t.bigint "lowest_round_id"
    t.bigint "easiest_hole_id"
    t.bigint "hardest_hole_id"
    t.decimal "hcap_diff", precision: 3, scale: 1, default: "0.0", null: false
  end

  create_table "round_tee_times", force: :cascade do |t|
    t.bigint "tournament_round_id"
    t.string "group"
    t.string "player_one"
    t.string "player_two"
    t.string "player_three"
    t.string "player_four"
    t.datetime "tee_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tournament_round_id"], name: "index_round_tee_times_on_tournament_round_id"
  end

  create_table "rounds", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "course_id"
    t.integer "score"
    t.integer "putts"
    t.integer "handicap"
    t.integer "round_num"
    t.datetime "date_played"
    t.datetime "tee_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "tournament_id"
    t.integer "s1"
    t.integer "s2"
    t.integer "s3"
    t.integer "s4"
    t.integer "s5"
    t.integer "s6"
    t.integer "s7"
    t.integer "s8"
    t.integer "s9"
    t.integer "s10"
    t.integer "s11"
    t.integer "s12"
    t.integer "s13"
    t.integer "s14"
    t.integer "s15"
    t.integer "s16"
    t.integer "s17"
    t.integer "s18"
    t.integer "p1"
    t.integer "p2"
    t.integer "p3"
    t.integer "p4"
    t.integer "p5"
    t.integer "p6"
    t.integer "p7"
    t.integer "p8"
    t.integer "p9"
    t.integer "p10"
    t.integer "p11"
    t.integer "p12"
    t.integer "p13"
    t.integer "p14"
    t.integer "p15"
    t.integer "p16"
    t.integer "p17"
    t.integer "p18"
    t.integer "net1"
    t.integer "net2"
    t.integer "net3"
    t.integer "net4"
    t.integer "net5"
    t.integer "net6"
    t.integer "net7"
    t.integer "net8"
    t.integer "net9"
    t.integer "net10"
    t.integer "net11"
    t.integer "net12"
    t.integer "net13"
    t.integer "net14"
    t.integer "net15"
    t.integer "net16"
    t.integer "net17"
    t.integer "net18"
    t.index ["course_id"], name: "index_rounds_on_course_id"
    t.index ["tournament_id"], name: "index_rounds_on_tournament_id"
    t.index ["user_id"], name: "index_rounds_on_user_id"
  end

  create_table "scorecards", force: :cascade do |t|
    t.integer "total_score", default: 0
    t.integer "total_putts", default: 0
    t.integer "total_3putts", default: 0
    t.bigint "new_course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "tournament_round_id"
    t.integer "total_net", default: 0
    t.integer "round_num"
    t.integer "handicap", default: 0
    t.integer "net_skin_total", default: 0
    t.integer "gross_skin_total", default: 0
    t.boolean "finished", default: false
    t.integer "leaderboard_id"
    t.boolean "dnf", default: false
    t.index ["new_course_id"], name: "index_scorecards_on_new_course_id"
    t.index ["tournament_round_id"], name: "index_scorecards_on_tournament_round_id"
    t.index ["user_id"], name: "index_scorecards_on_user_id"
  end

  create_table "skins_moneys", force: :cascade do |t|
    t.integer "tournament_id"
    t.integer "user_id"
    t.integer "round_one", default: 0
    t.integer "round_two", default: 0
    t.integer "round_three", default: 0
    t.integer "total", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "leaderboard_id"
  end

  create_table "stroke_moneys", force: :cascade do |t|
    t.integer "tournament_id"
    t.integer "user_id"
    t.integer "position"
    t.integer "money", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "team_cards", force: :cascade do |t|
    t.bigint "team_id"
    t.bigint "scorecard_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "position", default: 0
    t.index ["scorecard_id"], name: "index_team_cards_on_scorecard_id"
    t.index ["team_id"], name: "index_team_cards_on_team_id"
  end

  create_table "team_moneys", force: :cascade do |t|
    t.integer "tournament_id"
    t.integer "user_id"
    t.integer "round_one", default: 0
    t.integer "round_two", default: 0
    t.integer "round_three", default: 0
    t.integer "total", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "team_scores", force: :cascade do |t|
    t.integer "team_id"
    t.integer "number"
    t.integer "net"
    t.integer "par"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "score_1_id"
    t.integer "score_2_id"
  end

  create_table "teams", force: :cascade do |t|
    t.integer "new_course_id"
    t.integer "tournament_round_id"
    t.boolean "finished", default: false
    t.integer "total_net", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "group"
    t.boolean "is_won", default: false
    t.datetime "group_time"
  end

  create_table "tee_times", force: :cascade do |t|
    t.integer "user_id"
    t.integer "tournament_round_id"
    t.datetime "tee_time"
    t.string "group"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "team_id"
  end

  create_table "tournament_aggs", force: :cascade do |t|
    t.bigint "tournament_id"
    t.integer "putts_avg"
    t.integer "net_avg"
    t.string "lowest_round"
    t.string "highest_round"
    t.integer "par3_avg"
    t.integer "par4_avg"
    t.integer "par5_avg"
    t.string "hardest_hole"
    t.string "easiest_hole"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tournament_id"], name: "index_tournament_aggs_on_tournament_id"
  end

  create_table "tournament_leaderboards", force: :cascade do |t|
    t.bigint "tournament_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "leaderboard_id"
    t.index ["tournament_id"], name: "index_tournament_leaderboards_on_tournament_id"
  end

  create_table "tournament_new_courses", force: :cascade do |t|
    t.bigint "new_course_id"
    t.bigint "tournament_id"
    t.integer "round_num"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["new_course_id"], name: "index_tournament_new_courses_on_new_course_id"
    t.index ["tournament_id"], name: "index_tournament_new_courses_on_tournament_id"
  end

  create_table "tournament_rounds", force: :cascade do |t|
    t.bigint "tournament_id"
    t.integer "round_number"
    t.datetime "round_date"
    t.datetime "tee_time_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "new_course_id"
    t.index ["new_course_id"], name: "index_tournament_rounds_on_new_course_id"
    t.index ["tournament_id"], name: "index_tournament_rounds_on_tournament_id"
  end

  create_table "tournament_users", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "tournament_id"
    t.string "role", default: "member"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tournament_id"], name: "index_tournament_users_on_tournament_id"
    t.index ["user_id"], name: "index_tournament_users_on_user_id"
  end

  create_table "tournaments", force: :cascade do |t|
    t.string "name"
    t.integer "year"
    t.integer "num_players"
    t.integer "num_rounds"
    t.datetime "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "start_date"
  end

  create_table "user_aggs", force: :cascade do |t|
    t.bigint "user_id"
    t.decimal "gross_avg"
    t.decimal "net_avg"
    t.decimal "putts_avg"
    t.decimal "three_putts_avg"
    t.decimal "greens_in_reg"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "hcap_diff", default: "0.0"
    t.bigint "lowest_round_id"
    t.decimal "par3_avg", default: "0.0"
    t.decimal "par4_avg", default: "0.0"
    t.decimal "par5_avg", default: "0.0"
    t.decimal "hcap_avg", default: "0.0"
  end

  create_table "user_course_aggs", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "new_course_id"
    t.decimal "gross_avg"
    t.decimal "net_avg"
    t.decimal "putts_avg"
    t.decimal "three_putts_avg"
    t.decimal "greens_in_reg"
    t.decimal "par3_avg"
    t.decimal "par4_avg"
    t.decimal "par5_avg"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "count", default: 0
    t.decimal "hcap_diff", default: "0.0"
    t.bigint "easiest_hole_id"
    t.bigint "hardest_hole_id"
    t.bigint "lowest_round_id"
  end

  create_table "user_hole_aggs", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "hole_id"
    t.decimal "net_avg"
    t.decimal "gross_avg"
    t.decimal "putts_avg"
    t.decimal "three_putts_avg"
    t.integer "count"
    t.decimal "greens_in_reg"
    t.integer "par"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_course_agg_id"
  end

  create_table "user_scores", force: :cascade do |t|
    t.bigint "scorecard_id"
    t.integer "score"
    t.integer "putts"
    t.boolean "skin", default: false
    t.integer "net"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "net_skin", default: false
    t.integer "hole_id"
    t.integer "number", default: 1
    t.integer "handicap"
    t.integer "par"
    t.index ["scorecard_id"], name: "index_user_scores_on_scorecard_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.boolean "admin", default: false
    t.string "username"
    t.decimal "handicap"
    t.string "home"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "profile_image_id"
    t.string "gender"
    t.string "first_name"
    t.string "last_name"
    t.string "password_digest"
    t.string "reset_digest"
    t.string "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token"
  end

  add_foreign_key "holes", "new_courses"
  add_foreign_key "round_tee_times", "tournament_rounds"
  add_foreign_key "rounds", "courses"
  add_foreign_key "rounds", "tournaments"
  add_foreign_key "rounds", "users"
  add_foreign_key "scorecards", "new_courses"
  add_foreign_key "scorecards", "tournament_rounds"
  add_foreign_key "scorecards", "users"
  add_foreign_key "team_cards", "scorecards"
  add_foreign_key "team_cards", "teams"
  add_foreign_key "tournament_leaderboards", "tournaments"
  add_foreign_key "tournament_rounds", "tournaments"
  add_foreign_key "user_scores", "scorecards"
end
