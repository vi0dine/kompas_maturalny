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

ActiveRecord::Schema.define(version: 2019_06_16_200308) do

  create_table "field_of_studies", force: :cascade do |t|
    t.string "name"
    t.integer "field_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "matura_results", force: :cascade do |t|
    t.integer "user_id"
    t.integer "level"
    t.integer "result"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "matura_subject_id"
    t.index ["matura_subject_id"], name: "index_matura_results_on_matura_subject_id"
    t.index ["user_id"], name: "index_matura_results_on_user_id"
  end

  create_table "matura_subjects", force: :cascade do |t|
    t.string "name"
    t.integer "subject_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "study_interests", force: :cascade do |t|
    t.integer "field_of_study_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["field_of_study_id"], name: "index_study_interests_on_field_of_study_id"
    t.index ["user_id"], name: "index_study_interests_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "password_salt"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username", null: false
    t.date "date_of_birth"
    t.integer "gender"
    t.string "city"
    t.integer "account_type", null: false
    t.date "date_of_matura"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end