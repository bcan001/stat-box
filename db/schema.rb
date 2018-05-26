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

ActiveRecord::Schema.define(version: 2018_05_26_144255) do

  create_table "leagues", force: :cascade do |t|
    t.integer "sport_id"
    t.string "name"
    t.index ["name"], name: "index_leagues_on_name"
    t.index ["sport_id", "name"], name: "index_leagues_on_sport_id_and_name"
  end

  create_table "matches", force: :cascade do |t|
    t.datetime "match_datetime"
    t.integer "sport_id"
    t.integer "league_id"
    t.integer "team1_id"
    t.integer "team2_id"
    t.index ["match_datetime", "league_id"], name: "index_matches_on_match_datetime_and_league_id"
    t.index ["match_datetime", "sport_id"], name: "index_matches_on_match_datetime_and_sport_id"
    t.index ["team1_id", "match_datetime"], name: "index_matches_on_team1_id_and_match_datetime"
    t.index ["team2_id", "match_datetime"], name: "index_matches_on_team2_id_and_match_datetime"
  end

  create_table "sports", force: :cascade do |t|
    t.string "name"
    t.index ["name"], name: "index_sports_on_name"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.integer "league_id"
    t.integer "sport_id"
    t.index ["league_id"], name: "index_teams_on_league_id"
    t.index ["sport_id"], name: "index_teams_on_sport_id"
  end

  create_table "user_favorites", force: :cascade do |t|
    t.integer "user_id"
    t.string "favorite_type"
    t.integer "favorite_id"
    t.index ["favorite_type", "favorite_id"], name: "index_user_favorites_on_favorite_type_and_favorite_id"
    t.index ["user_id", "favorite_type"], name: "index_user_favorites_on_user_id_and_favorite_type"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

end
