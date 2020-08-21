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

ActiveRecord::Schema.define(version: 20160416065456) do

  create_table "patients", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "middle_name"
    t.integer  "patient_number"
    t.string   "title"
    t.date     "birtday"
    t.text     "address"
    t.text     "diagnosis"
    t.string   "guardian"
    t.string   "physician"
    t.integer  "user_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "email"
    t.string   "patient_avatar_file_name"
    t.string   "patient_avatar_content_type"
    t.integer  "patient_avatar_file_size"
    t.datetime "patient_avatar_updated_at"
    t.integer  "treatment_id"
    t.string   "con_number"
    t.date     "consult_date"
    t.string   "patient_od_file_name"
    t.string   "patient_od_content_type"
    t.integer  "patient_od_file_size"
    t.datetime "patient_od_updated_at"
  end

  add_index "patients", ["treatment_id"], name: "index_patients_on_treatment_id"
  add_index "patients", ["user_id"], name: "index_patients_on_user_id"

  create_table "treatments", force: :cascade do |t|
    t.date     "teartment_date"
    t.integer  "tooth_number"
    t.text     "remark"
    t.float    "fee"
    t.float    "paid"
    t.float    "balance"
    t.float    "associate"
    t.float    "clinic"
    t.integer  "patient_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "user_id"
    t.string   "patient_xray_file_name"
    t.string   "patient_xray_content_type"
    t.integer  "patient_xray_file_size"
    t.datetime "patient_xray_updated_at"
  end

  add_index "treatments", ["patient_id"], name: "index_treatments_on_patient_id"
  add_index "treatments", ["user_id"], name: "index_treatments_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin"
    t.integer  "personel_number"
    t.string   "last_name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
