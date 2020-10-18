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

ActiveRecord::Schema.define(version: 2020_10_15_212839) do

  create_table "cart_items", force: :cascade do |t|
    t.integer "cart_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "item_id"
    t.integer "quantity", default: 1
  end

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.string "profile_image_id"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "quantity"
  end

  create_table "maps", force: :cascade do |t|
    t.text "address"
    t.float "latitude"
    t.float "longitude"
    t.integer "distance"
    t.integer "near_distance"
    t.integer "time"
    t.integer "near_time"
    t.text "title"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "phone_reservations", force: :cascade do |t|
    t.date "worked_on"
    t.string "reservation_line_flag"
    t.text "reservation_work"
    t.string "client_name_flag"
    t.integer "user_id"
    t.integer "staff_id"
    t.integer "line_time"
    t.boolean "reservation_mark", default: false
    t.boolean "line_end", default: false
    t.boolean "holiday", default: false
    t.boolean "line_booked", default: false
    t.text "time_work"
    t.string "time_line_flag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_phone_reservations_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "user_id"
    t.string "content"
    t.integer "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_id"
    t.float "rate"
    t.string "name"
    t.string "email"
    t.index ["user_id"], name: "index_reviews_on_user_id"
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
    t.boolean "admin"
    t.index ["email"], name: "index_staffs_on_email", unique: true
    t.index ["reset_password_token"], name: "index_staffs_on_reset_password_token", unique: true
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

  create_table "work_histories", force: :cascade do |t|
    t.date "worked_on"
    t.datetime "start_date"
    t.datetime "end_date"
    t.text "reservation_work"
    t.string "reservation_mark"
    t.string "client_name_flag"
    t.string "main_menu"
    t.string "option_menu"
    t.time "start_times"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_work_histories_on_user_id"
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
    t.string "main_menu"
    t.string "option_menu"
    t.time "start_times"
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
