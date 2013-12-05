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

ActiveRecord::Schema.define(version: 20131205105042) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: true do |t|
    t.string   "email",              default: "", null: false
    t.string   "encrypted_password", default: "", null: false
    t.integer  "sign_in_count",      default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "failed_attempts",    default: 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bonus", id: false, force: true do |t|
    t.string  "ename", limit: 10
    t.string  "job",   limit: 9
    t.integer "sal"
    t.integer "comm"
  end

  create_table "dept", id: false, force: true do |t|
    t.integer "deptno"
    t.string  "dname",  limit: 14
    t.string  "loc",    limit: 13
  end

  create_table "emp", id: false, force: true do |t|
    t.integer "empno",               null: false
    t.string  "ename",    limit: 10
    t.string  "job",      limit: 9
    t.integer "mgr"
    t.date    "hiredate"
    t.integer "sal"
    t.integer "comm"
    t.integer "deptno"
  end

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

  add_index "lectures_users", ["lecture_id"], name: "index_lectures_users_on_lecture_id", using: :btree
  add_index "lectures_users", ["user_id"], name: "index_lectures_users_on_user_id", using: :btree

  create_table "meetings", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.date     "date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "made_by"
  end

  create_table "meetings_users", force: true do |t|
    t.integer  "meeting_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "meetings_users", ["meeting_id"], name: "index_meetings_users_on_meeting_id", using: :btree
  add_index "meetings_users", ["user_id"], name: "index_meetings_users_on_user_id", using: :btree

  create_table "messages", force: true do |t|
    t.string   "title"
    t.boolean  "membership"
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "messages", ["user_id"], name: "index_messages_on_user_id", using: :btree

  create_table "rails_admin_histories", force: true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      limit: 2
    t.integer  "year",       limit: 8
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], name: "index_rails_admin_histories", using: :btree

  create_table "readings", force: true do |t|
    t.string   "author"
    t.string   "title"
    t.text     "description"
    t.integer  "votes_for"
    t.boolean  "is_reworked"
    t.integer  "meeting_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "readings", ["user_id"], name: "index_readings_on_user_id", using: :btree

  create_table "salgrade", id: false, force: true do |t|
    t.integer "grade"
    t.integer "losal"
    t.integer "hisal"
  end

  create_table "users", force: true do |t|
    t.string   "full_name"
    t.string   "degree"
    t.boolean  "knkf_member"
    t.integer  "meeting_id"
    t.integer  "reading_id"
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
    t.boolean  "has_a_vote"
    t.string   "voting_for"
    t.boolean  "referee"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["meeting_id"], name: "index_users_on_meeting_id", using: :btree
  add_index "users", ["reading_id"], name: "index_users_on_reading_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
