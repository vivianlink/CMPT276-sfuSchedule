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

ActiveRecord::Schema.define(version: 20161202082438) do

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

  create_table "authorizations", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "courses", force: :cascade do |t|
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
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
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
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

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.datetime "time"
    t.string   "activity_type"
    t.string   "location"
    t.string   "group_owner"
    t.string   "member1"
    t.string   "member2"
    t.string   "member3"
    t.string   "member4"
    t.string   "description"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "user_id"
    t.integer  "member1id"
    t.integer  "member2id"
    t.integer  "member3id"
    t.integer  "member4id"
  end

  create_table "likes", force: :cascade do |t|
    t.boolean  "islike"
    t.integer  "publish_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string   "name"
    t.integer  "latitude"
    t.integer  "longitude"
    t.string   "user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "imgurl"
    t.string   "imgplaceholder"
    t.datetime "timestamp"
  end

  create_table "message_boards", force: :cascade do |t|
    t.string   "sender"
    t.string   "group_name"
    t.string   "message"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "publishes", force: :cascade do |t|
    t.string   "Rname"
    t.integer  "user_id"
    t.integer  "drink_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "image"
    t.text     "ingredients"
    t.text     "instructions"
  end

  create_table "ratings", force: :cascade do |t|
    t.string   "comment"
    t.integer  "rating"
    t.string   "prof_name"
    t.string   "user_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "relationships", force: :cascade do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "relationships", ["followed_id"], name: "index_relationships_on_followed_id", using: :btree
  add_index "relationships", ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true, using: :btree
  add_index "relationships", ["follower_id"], name: "index_relationships_on_follower_id", using: :btree

  create_table "reviews", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "reviews", ["user_id", "created_at"], name: "index_reviews_on_user_id_and_created_at", using: :btree
  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id", using: :btree

  create_table "trainers", force: :cascade do |t|
    t.string   "name"
    t.integer  "level"
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
