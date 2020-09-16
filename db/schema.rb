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

ActiveRecord::Schema.define(version: 2020_09_14_054451) do

  create_table "phone_reservations", force: :cascade do |t|
    t.date "worked_on"
    t.string "reservation_line_flag"
    t.text "reservation_work"
    t.string "reservation_mark"
    t.string "client_name_flag"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "staffs", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "kana"
    t.string "sex"
    t.string "age"
    t.string "line_id"
    t.string "address"
    t.string "phone_number"
    t.string "staff_number"
    t.index ["email"], name: "index_staffs_on_email", unique: true
    t.index ["reset_password_token"], name: "index_staffs_on_reset_password_token", unique: true
  end

  create_table "time_reservations", force: :cascade do |t|
    t.integer "line_time"
    t.string "time_line_flag"
    t.text "time_work"
    t.string "time_mark"
    t.string "client_name_flag"
    t.integer "user_id"
    t.integer "staff_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tools", force: :cascade do |t|
    t.string "tool_name"
    t.string "tool_explanation"
    t.string "image_id"
    t.integer "tool_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "price"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "kana"
    t.string "sex"
    t.string "line_id"
    t.string "address"
    t.string "phone_number"
    t.boolean "admin"
    t.integer "work_id"
    t.integer "reservation_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "videos", force: :cascade do |t|
    t.string "title"
    t.string "body"
    t.string "youtube_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "work_reservations", force: :cascade do |t|
    t.date "worked_on"
    t.datetime "start_date"
    t.datetime "end_date"
    t.text "reservation_work"
    t.string "reservation_mark"
    t.string "client_name_flag"
    t.integer "staff_id"
    t.integer "work_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_work_reservations_on_user_id"
  end

  create_table "works", force: :cascade do |t|
    t.string "content_name"
    t.string "content"
    t.string "profile_image_id"
    t.integer "reservation_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "content_price"
  end

end
