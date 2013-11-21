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

ActiveRecord::Schema.define(version: 20131121152749) do

  create_table "admins", force: true do |t|
    t.string   "full_name"
    t.string   "password"
    t.boolean  "approves_aplications"
    t.boolean  "schedules_lectures"
    t.boolean  "arranges_meetings"
    t.boolean  "upgrades_users_to_organization_members"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "applications", force: true do |t|
    t.text     "abstract"
    t.text     "description"
    t.string   "author_full_name"
    t.boolean  "approved"
    t.boolean  "membership"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "applications", ["user_id"], name: "index_applications_on_user_id"

  create_table "lectures", force: true do |t|
    t.string   "subject"
    t.string   "place"
    t.text     "description"
    t.date     "lecture_date"
    t.string   "lecturer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lectures_users", force: true do |t|
    t.integer  "lecture_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "lectures_users", ["lecture_id"], name: "index_lectures_users_on_lecture_id"
  add_index "lectures_users", ["user_id"], name: "index_lectures_users_on_user_id"

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
    t.string   "degree"
    t.boolean  "knkf_member"
    t.integer  "meeting_id"
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
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["meeting_id"], name: "index_users_on_meeting_id"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
