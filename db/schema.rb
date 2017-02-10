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

ActiveRecord::Schema.define(version: 20170210021220) do

  create_table "languages", force: :cascade do |t|
    t.string   "language"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "people", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.date     "date_of_birth"
    t.string   "gender"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
    t.index ["email"], name: "index_people_on_email", unique: true
  end

  create_table "roles", force: :cascade do |t|
    t.string   "field"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "skills", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "staff_members", force: :cascade do |t|
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "pod"
    t.date     "started_at_company"
    t.integer  "user_id"
    t.integer  "role_id"
    t.index ["role_id"], name: "index_staff_members_on_role_id"
    t.index ["user_id"], name: "index_staff_members_on_user_id"
  end

  create_table "user_languages", force: :cascade do |t|
    t.integer "user_id"
    t.integer "language_id"
    t.index ["language_id"], name: "index_user_languages_on_language_id"
    t.index ["user_id"], name: "index_user_languages_on_user_id"
  end

  create_table "user_skills", force: :cascade do |t|
    t.integer "user_id"
    t.integer "language_id"
    t.index ["language_id"], name: "index_user_skills_on_language_id"
    t.index ["user_id"], name: "index_user_skills_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password"
    t.date     "date_of_birth"
    t.string   "gender"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

end
