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

ActiveRecord::Schema.define(version: 20160130003111) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "courses", force: :cascade do |t|
    t.string   "name"
    t.decimal  "rating"
    t.integer  "slope"
    t.integer  "par"
    t.string   "tee"
    t.string   "city"
    t.string   "state"
    t.integer  "yardage"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.hstore   "scorecard",  default: {}, null: false
  end

  add_index "courses", ["scorecard"], name: "index_courses_on_scorecard", using: :gin

  create_table "rounds", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "course_id"
    t.integer  "score"
    t.integer  "putts"
    t.integer  "handicap"
    t.integer  "round_num"
    t.datetime "date_played"
    t.datetime "tee_time"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "tournament_id"
    t.hstore   "shots_card",    default: {}, null: false
    t.hstore   "putts_card",    default: {}, null: false
  end

  add_index "rounds", ["course_id"], name: "index_rounds_on_course_id", using: :btree
  add_index "rounds", ["putts_card"], name: "index_rounds_on_putts_card", using: :gin
  add_index "rounds", ["shots_card"], name: "index_rounds_on_shots_card", using: :gin
  add_index "rounds", ["tournament_id"], name: "index_rounds_on_tournament_id", using: :btree
  add_index "rounds", ["user_id"], name: "index_rounds_on_user_id", using: :btree

  create_table "tournaments", force: :cascade do |t|
    t.string   "name"
    t.integer  "year"
    t.integer  "num_players"
    t.integer  "num_rounds"
    t.datetime "end_date"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

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
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "rounds", "courses"
  add_foreign_key "rounds", "tournaments"
  add_foreign_key "rounds", "users"
end
