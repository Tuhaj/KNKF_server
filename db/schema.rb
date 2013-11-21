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

ActiveRecord::Schema.define(version: 20131121120507) do

  create_table "meetings", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.date     "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "meetings_users", force: true do |t|
    t.integer  "meeting_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "meetings_users", ["meeting_id"], name: "index_meetings_users_on_meeting_id"
  add_index "meetings_users", ["user_id"], name: "index_meetings_users_on_user_id"

  create_table "users", force: true do |t|
    t.string   "full_name"
    t.string   "email"
    t.string   "password"
    t.string   "password_confirmation"
    t.boolean  "knkf_member"
    t.integer  "meeting_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["meeting_id"], name: "index_users_on_meeting_id"

end
