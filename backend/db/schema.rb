# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_02_28_000353) do
  create_table "inventories", force: :cascade do |t|
    t.integer "item_id", null: false
    t.string "name"
    t.text "description"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_inventories_on_item_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.string "type"
    t.text "description"
    t.text "best_practice"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "leaderboards", force: :cascade do |t|
    t.integer "player"
    t.integer "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "level_rewards", force: :cascade do |t|
    t.integer "level_id", null: false
    t.integer "reward_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["level_id"], name: "index_level_rewards_on_level_id"
    t.index ["reward_id"], name: "index_level_rewards_on_reward_id"
  end

  create_table "levels", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.boolean "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lobbies", force: :cascade do |t|
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lobby_levels", force: :cascade do |t|
    t.integer "lobby_id", null: false
    t.integer "level_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["level_id"], name: "index_lobby_levels_on_level_id"
    t.index ["lobby_id"], name: "index_lobby_levels_on_lobby_id"
  end

  create_table "mission_levels", force: :cascade do |t|
    t.integer "mission_id", null: false
    t.integer "level_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["level_id"], name: "index_mission_levels_on_level_id"
    t.index ["mission_id"], name: "index_mission_levels_on_mission_id"
  end

  create_table "missions", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "name"
    t.text "instructions"
    t.boolean "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_missions_on_user_id"
  end

  create_table "reward_users", force: :cascade do |t|
    t.integer "reward_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reward_id"], name: "index_reward_users_on_reward_id"
    t.index ["user_id"], name: "index_reward_users_on_user_id"
  end

  create_table "rewards", force: :cascade do |t|
    t.string "name"
    t.string "type"
    t.text "description"
    t.boolean "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_leaderboards", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "leaderboard_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["leaderboard_id"], name: "index_user_leaderboards_on_leaderboard_id"
    t.index ["user_id"], name: "index_user_leaderboards_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "inventories", "items"
  add_foreign_key "level_rewards", "levels"
  add_foreign_key "level_rewards", "rewards"
  add_foreign_key "lobby_levels", "levels"
  add_foreign_key "lobby_levels", "lobbies"
  add_foreign_key "mission_levels", "levels"
  add_foreign_key "mission_levels", "missions"
  add_foreign_key "missions", "users"
  add_foreign_key "reward_users", "rewards"
  add_foreign_key "reward_users", "users"
  add_foreign_key "user_leaderboards", "leaderboards"
  add_foreign_key "user_leaderboards", "users"
end
