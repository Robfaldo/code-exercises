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

ActiveRecord::Schema[7.0].define(version: 2022_12_18_093935) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attempts", force: :cascade do |t|
    t.string "github_repo_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "exercise_id", null: false
    t.string "github_pr_url"
    t.boolean "completed", default: false
    t.bigint "user_id", null: false
    t.index ["exercise_id"], name: "index_attempts_on_exercise_id"
    t.index ["user_id"], name: "index_attempts_on_user_id"
  end

  create_table "exercises", force: :cascade do |t|
    t.string "name"
    t.string "github_repo_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "trail_id", null: false
    t.index ["trail_id"], name: "index_exercises_on_trail_id"
  end

  create_table "trails", force: :cascade do |t|
    t.text "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.string "github_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "attempts", "exercises"
  add_foreign_key "attempts", "users"
  add_foreign_key "exercises", "trails"
end
