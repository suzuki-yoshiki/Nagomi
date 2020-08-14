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

ActiveRecord::Schema.define(version: 2020_08_13_085031) do

  create_table "resrvations", force: :cascade do |t|
    t.date "worked_on"
    t.time "line_time"
    t.string "reservation_line_flag"
    t.datetime "start_date"
    t.datetime "end_date"
    t.text "reservation_work"
    t.string "reservation_mark"
    t.string "client_name_flag"
    t.integer "user_id"
    t.integer "staff_id"
    t.integer "work_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "works", force: :cascade do |t|
    t.string "content_name"
    t.string "content"
    t.string "profile_image_id"
    t.integer "reservation_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
