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

ActiveRecord::Schema[8.0].define(version: 2025_07_16_021516) do
  create_table "meetup_availabilities", force: :cascade do |t|
    t.integer "meetup_id", null: false
    t.integer "user_id", null: false
    t.integer "time_slot_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["meetup_id"], name: "index_meetup_availabilities_on_meetup_id"
    t.index ["time_slot_id"], name: "index_meetup_availabilities_on_time_slot_id"
    t.index ["user_id"], name: "index_meetup_availabilities_on_user_id"
  end

  create_table "meetup_memberships", force: :cascade do |t|
    t.integer "meetup_id", null: false
    t.integer "user_id", null: false
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["meetup_id"], name: "index_meetup_memberships_on_meetup_id"
    t.index ["user_id"], name: "index_meetup_memberships_on_user_id"
  end

  create_table "meetup_participants", force: :cascade do |t|
    t.integer "meetup_id", null: false
    t.integer "user_id", null: false
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["meetup_id"], name: "index_meetup_participants_on_meetup_id"
    t.index ["user_id"], name: "index_meetup_participants_on_user_id"
  end

  create_table "meetups", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "creator_id"
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "time_slots", force: :cascade do |t|
    t.integer "day_of_week"
    t.time "start_time"
    t.time "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["day_of_week", "start_time"], name: "index_time_slots_on_day_of_week_and_start_time", unique: true
  end

  create_table "user_availabilities", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "time_slot_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["time_slot_id"], name: "index_user_availabilities_on_time_slot_id"
    t.index ["user_id", "time_slot_id"], name: "index_user_availabilities_on_user_id_and_time_slot_id", unique: true
    t.index ["user_id"], name: "index_user_availabilities_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "time_zone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "meetup_availabilities", "meetups"
  add_foreign_key "meetup_availabilities", "time_slots"
  add_foreign_key "meetup_availabilities", "users"
  add_foreign_key "meetup_memberships", "meetups"
  add_foreign_key "meetup_memberships", "users"
  add_foreign_key "meetup_participants", "meetups"
  add_foreign_key "meetup_participants", "users"
  add_foreign_key "user_availabilities", "time_slots"
  add_foreign_key "user_availabilities", "users"
end
