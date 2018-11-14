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

ActiveRecord::Schema.define(version: 2018_11_14_090246) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "availabilities", force: :cascade do |t|
    t.datetime "start_date"
    t.datetime "end_date"
    t.bigint "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_availabilities_on_student_id"
  end

  create_table "facilities", force: :cascade do |t|
    t.string "address"
    t.string "description"
    t.bigint "user_id"
    t.string "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
    t.string "name"
    t.index ["user_id"], name: "index_facilities_on_user_id"
  end

  create_table "favorite_facilities", force: :cascade do |t|
    t.bigint "student_id"
    t.bigint "facility_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["facility_id"], name: "index_favorite_facilities_on_facility_id"
    t.index ["student_id"], name: "index_favorite_facilities_on_student_id"
  end

  create_table "fits", force: :cascade do |t|
    t.bigint "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "mission_id"
    t.boolean "refused", default: false
    t.index ["mission_id"], name: "index_fits_on_mission_id"
    t.index ["student_id"], name: "index_fits_on_student_id"
  end

  create_table "missions", force: :cascade do |t|
    t.bigint "senior_id"
    t.bigint "student_id"
    t.datetime "start_time"
    t.datetime "end_time"
    t.string "description"
    t.integer "review_ponctuality"
    t.integer "review_communication"
    t.integer "review_satisfaction"
    t.string "review_comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "pending", default: true
    t.index ["senior_id"], name: "index_missions_on_senior_id"
    t.index ["student_id"], name: "index_missions_on_student_id"
  end

  create_table "seniors", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.string "description"
    t.bigint "facility_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["facility_id"], name: "index_seniors_on_facility_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.date "date_of_birth"
    t.string "address"
    t.string "studies"
    t.string "school"
    t.integer "phone_number"
    t.string "photo"
    t.string "email"
    t.string "motivation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_students_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "student"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "availabilities", "students"
  add_foreign_key "facilities", "users"
  add_foreign_key "favorite_facilities", "facilities"
  add_foreign_key "favorite_facilities", "students"
  add_foreign_key "fits", "students"
  add_foreign_key "missions", "seniors"
  add_foreign_key "missions", "students"
  add_foreign_key "seniors", "facilities"
  add_foreign_key "students", "users"
end
