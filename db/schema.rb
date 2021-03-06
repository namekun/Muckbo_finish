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

ActiveRecord::Schema.define(version: 20180720065656) do

  create_table "admissions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "room_id"
    t.boolean  "ready_state", default: false, null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["room_id"], name: "index_admissions_on_room_id"
    t.index ["user_id"], name: "index_admissions_on_user_id"
  end

  create_table "chats", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "room_id"
    t.text     "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_chats_on_room_id"
    t.index ["user_id"], name: "index_chats_on_user_id"
  end

  create_table "reports", force: :cascade do |t|
    t.string   "user_email"
    t.integer  "user_id"
    t.integer  "report_reason"
    t.text     "report_description"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "rooms", force: :cascade do |t|
    t.string   "room_title"
    t.string   "master_id"
    t.integer  "max_count"
    t.integer  "admissions_count", default: 0
    t.boolean  "room_state",       default: false, null: false
    t.integer  "start_time_hour"
    t.string   "start_time_min"
    t.datetime "meet_time_end"
    t.string   "hashtag"
    t.string   "food_type"
    t.string   "room_type"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "rooms_tags", id: false, force: :cascade do |t|
    t.integer "room_id"
    t.integer "tag_id"
    t.index ["room_id"], name: "index_rooms_tags_on_room_id"
    t.index ["tag_id"], name: "index_rooms_tags_on_tag_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_chat_logs", force: :cascade do |t|
    t.string   "room_title"
    t.integer  "room_id"
    t.integer  "user_id"
    t.string   "nickname"
    t.date     "chat_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "nickname",               default: "", null: false
    t.string   "major",                  default: "", null: false
    t.string   "another_major"
    t.string   "sex"
    t.string   "phone",                  default: "", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["nickname"], name: "index_users_on_nickname", unique: true
    t.index ["phone"], name: "index_users_on_phone", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
