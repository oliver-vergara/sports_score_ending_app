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

ActiveRecord::Schema.define(version: 20160611065100) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bets", force: :cascade do |t|
    t.integer  "better_id"
    t.integer  "game_id"
    t.integer  "combo_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bets", ["better_id"], name: "index_bets_on_better_id", using: :btree
  add_index "bets", ["combo_id"], name: "index_bets_on_combo_id", using: :btree
  add_index "bets", ["game_id"], name: "index_bets_on_game_id", using: :btree

  create_table "combos", force: :cascade do |t|
    t.string   "pick"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "combos", ["pick"], name: "index_combos_on_pick", using: :btree

  create_table "games", force: :cascade do |t|
    t.string   "name"
    t.integer  "winning_score"
    t.integer  "losing_score"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "completed",                             default: true
    t.string   "schedule"
    t.decimal  "bet_amount",    precision: 9, scale: 2
    t.integer  "banker_id"
  end

  add_index "games", ["banker_id"], name: "index_games_on_banker_id", using: :btree
  add_index "games", ["losing_score"], name: "index_games_on_losing_score", using: :btree
  add_index "games", ["winning_score"], name: "index_games_on_winning_score", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                                          default: "", null: false
    t.string   "encrypted_password",                             default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                                  default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "balance",                precision: 9, scale: 2
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
