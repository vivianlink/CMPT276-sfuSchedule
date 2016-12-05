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

ActiveRecord::Schema.define(version: 20161205024639) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ar_internal_metadata", primary_key: "key", force: :cascade do |t|
    t.string   "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "courses", force: :cascade do |t|
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "year"
    t.string   "semester"
    t.string   "faculty"
    t.string   "number"
    t.string   "section"
    t.string   "instructor"
    t.string   "schedule"
    t.string   "description"
    t.string   "unit"
    t.string   "Unit"
    t.string   "CourseUrl"
    t.string   "designation"
    t.string   "calender"
    t.string   "RoomNumber"
    t.integer  "viewCount"
    t.integer  "cartCount"
    t.string   "requiredtext"
    t.string   "prereq"
    t.string   "coreq"
    t.string   "title"
    t.string   "additionDetails"
    t.string   "deliveryMethod"
  end

  create_table "courses_users", force: :cascade do |t|
    t.integer "course_id"
    t.integer "user_id"
  end

  create_table "d_courses", force: :cascade do |t|
    t.string   "dCourseNumber"
    t.string   "dTitle"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "d_details", force: :cascade do |t|
    t.string   "dProfessor"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "DSchedule"
    t.string   "dUnit"
    t.string   "dDesignation"
    t.string   "sectioncode"
    t.string   "calender"
    t.string   "RoomNumber"
    t.string   "requiredtext"
    t.string   "prereq"
    t.string   "coreq"
    t.string   "title"
    t.string   "coursedetails"
    t.string   "additionDetails"
    t.string   "deliveryMethod"
  end

  create_table "d_faculties", force: :cascade do |t|
    t.string   "dSubject"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "d_sections", force: :cascade do |t|
    t.string   "dSectionNumber"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "d_semesters", force: :cascade do |t|
    t.string   "dSemesterSeasons"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "d_years", force: :cascade do |t|
    t.string   "dYearNumber"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ratings", force: :cascade do |t|
    t.string   "comment"
    t.integer  "rating"
    t.string   "prof_name"
    t.string   "user_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tutorials", force: :cascade do |t|
    t.string   "tutname"
    t.string   "tutcalender"
    t.string   "tutlocation"
    t.string   "tutschedule"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "course_id"
    t.string   "TutUrl"
  end

  create_table "tutorials_users", force: :cascade do |t|
    t.integer "tutorial_id"
    t.integer "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.string   "encrypted_password"
    t.string   "salt"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.boolean  "is_admin"
  end

  create_table "widgets", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "stock"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
