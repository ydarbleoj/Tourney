# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160504165125) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", force: :cascade do |t|
    t.string   "name"
    t.decimal  "rating"
    t.integer  "slope"
    t.integer  "par"
    t.string   "tee"
    t.string   "city"
    t.string   "state"
    t.integer  "yardage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "h1_yds"
    t.integer  "h2_yds"
    t.integer  "h3_yds"
    t.integer  "h4_yds"
    t.integer  "h5_yds"
    t.integer  "h6_yds"
    t.integer  "h7_yds"
    t.integer  "h8_yds"
    t.integer  "h9_yds"
    t.integer  "h10_yds"
    t.integer  "h11_yds"
    t.integer  "h12_yds"
    t.integer  "h13_yds"
    t.integer  "h14_yds"
    t.integer  "h15_yds"
    t.integer  "h16_yds"
    t.integer  "h17_yds"
    t.integer  "h18_yds"
    t.integer  "h1_par"
    t.integer  "h2_par"
    t.integer  "h3_par"
    t.integer  "h4_par"
    t.integer  "h5_par"
    t.integer  "h6_par"
    t.integer  "h7_par"
    t.integer  "h8_par"
    t.integer  "h9_par"
    t.integer  "h10_par"
    t.integer  "h11_par"
    t.integer  "h12_par"
    t.integer  "h13_par"
    t.integer  "h14_par"
    t.integer  "h15_par"
    t.integer  "h16_par"
    t.integer  "h17_par"
    t.integer  "h18_par"
    t.integer  "h1_hcap"
    t.integer  "h2_hcap"
    t.integer  "h3_hcap"
    t.integer  "h4_hcap"
    t.integer  "h5_hcap"
    t.integer  "h6_hcap"
    t.integer  "h7_hcap"
    t.integer  "h8_hcap"
    t.integer  "h9_hcap"
    t.integer  "h10_hcap"
    t.integer  "h11_hcap"
    t.integer  "h12_hcap"
    t.integer  "h13_hcap"
    t.integer  "h14_hcap"
    t.integer  "h15_hcap"
    t.integer  "h16_hcap"
    t.integer  "h17_hcap"
    t.integer  "h18_hcap"
    t.integer  "out_yds"
    t.integer  "in_yds"
    t.integer  "out_par"
    t.integer  "in_par"
  end

  create_table "holes", force: :cascade do |t|
    t.integer  "number"
    t.integer  "par"
    t.integer  "yards"
    t.integer  "handicap"
    t.integer  "new_course_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "holes", ["new_course_id"], name: "index_holes_on_new_course_id", using: :btree

  create_table "leaderboards", force: :cascade do |t|
    t.integer  "rnd1_score"
    t.integer  "rnd2_score"
    t.integer  "rnd3_score"
    t.integer  "rnd1_putts"
    t.integer  "rnd2_putts"
    t.integer  "rnd3_putts"
    t.integer  "total_score"
    t.integer  "total_putts"
    t.integer  "total_3_putts"
    t.integer  "net_total"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "tournament_id"
    t.integer  "user_id"
    t.integer  "handicap"
    t.integer  "rn1_3putts"
    t.integer  "rnd2_3putts"
    t.integer  "rnd3_3putts"
  end

  add_index "leaderboards", ["tournament_id"], name: "index_leaderboards_on_tournament_id", using: :btree
  add_index "leaderboards", ["user_id"], name: "index_leaderboards_on_user_id", using: :btree

  create_table "new_courses", force: :cascade do |t|
    t.string   "name"
    t.integer  "slope"
    t.integer  "rating"
    t.string   "tee"
    t.string   "state"
    t.string   "city"
    t.integer  "par"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rounds", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "course_id"
    t.integer  "score"
    t.integer  "putts"
    t.integer  "handicap"
    t.integer  "round_num"
    t.datetime "date_played"
    t.datetime "tee_time"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "tournament_id"
    t.integer  "s1"
    t.integer  "s2"
    t.integer  "s3"
    t.integer  "s4"
    t.integer  "s5"
    t.integer  "s6"
    t.integer  "s7"
    t.integer  "s8"
    t.integer  "s9"
    t.integer  "s10"
    t.integer  "s11"
    t.integer  "s12"
    t.integer  "s13"
    t.integer  "s14"
    t.integer  "s15"
    t.integer  "s16"
    t.integer  "s17"
    t.integer  "s18"
    t.integer  "p1"
    t.integer  "p2"
    t.integer  "p3"
    t.integer  "p4"
    t.integer  "p5"
    t.integer  "p6"
    t.integer  "p7"
    t.integer  "p8"
    t.integer  "p9"
    t.integer  "p10"
    t.integer  "p11"
    t.integer  "p12"
    t.integer  "p13"
    t.integer  "p14"
    t.integer  "p15"
    t.integer  "p16"
    t.integer  "p17"
    t.integer  "p18"
  end

  add_index "rounds", ["course_id"], name: "index_rounds_on_course_id", using: :btree
  add_index "rounds", ["tournament_id"], name: "index_rounds_on_tournament_id", using: :btree
  add_index "rounds", ["user_id"], name: "index_rounds_on_user_id", using: :btree

  create_table "scorecards", force: :cascade do |t|
    t.integer  "total_score"
    t.integer  "total_putts"
    t.integer  "total_3putts"
    t.integer  "new_course_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "scorecards", ["new_course_id"], name: "index_scorecards_on_new_course_id", using: :btree

  create_table "tournaments", force: :cascade do |t|
    t.string   "name"
    t.integer  "year"
    t.integer  "num_players"
    t.integer  "num_rounds"
    t.datetime "end_date"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "user_scores", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "scorecard_id"
    t.integer  "number"
    t.integer  "score"
    t.integer  "putts"
    t.boolean  "skin"
    t.integer  "net"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "handicap"
  end

  add_index "user_scores", ["scorecard_id"], name: "index_user_scores_on_scorecard_id", using: :btree
  add_index "user_scores", ["user_id"], name: "index_user_scores_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.boolean  "admin",                  default: false
    t.string   "username"
    t.decimal  "handicap"
    t.string   "home"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "profile_image_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "holes", "new_courses"
  add_foreign_key "rounds", "courses"
  add_foreign_key "rounds", "tournaments"
  add_foreign_key "rounds", "users"
  add_foreign_key "scorecards", "new_courses"
  add_foreign_key "user_scores", "scorecards"
  add_foreign_key "user_scores", "users"
end
