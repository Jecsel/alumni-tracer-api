# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2024_01_01_152606) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "alumni_mains", force: :cascade do |t|
    t.bigint "user_id"
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.integer "batch_year"
    t.date "dob"
    t.integer "age"
    t.integer "civil_status"
    t.integer "gender"
    t.string "region"
    t.string "province"
    t.string "municipality"
    t.string "barangay"
    t.string "course"
    t.integer "year_graduated"
    t.string "email_address"
    t.string "phone_number"
    t.string "is_working"
    t.string "work_type"
    t.string "work_position"
    t.string "business_name"
    t.string "company_name"
    t.string "company_address"
    t.string "company_acronym"
    t.string "type_of_business"
    t.string "area_of_business"
    t.string "business_address"
    t.string "business_acronym"
    t.string "business_related"
    t.string "line_of_busines"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_alumni_mains_on_user_id"
  end

  create_table "event_posts", force: :cascade do |t|
    t.bigint "user_id"
    t.string "title"
    t.string "venue"
    t.date "date"
    t.string "time"
    t.string "sponsor"
    t.integer "status", default: 0
    t.boolean "is_active", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_event_posts_on_user_id"
  end

  create_table "job_posts", force: :cascade do |t|
    t.bigint "user_id"
    t.string "company_name"
    t.string "company_email"
    t.string "company_address"
    t.string "position"
    t.string "date_of_submission"
    t.string "date_posted"
    t.string "qualification"
    t.integer "status", default: 0
    t.boolean "is_active", default: false
    t.date "deployment_date"
    t.date "active_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "job_seeker_email"
    t.string "job_seeker_contact"
    t.index ["user_id"], name: "index_job_posts_on_user_id"
  end

  create_table "user_roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password"
    t.string "user_token"
    t.bigint "user_type_id"
    t.bigint "user_role_id"
    t.boolean "is_active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_role_id"], name: "index_users_on_user_role_id"
    t.index ["user_type_id"], name: "index_users_on_user_type_id"
  end

  create_table "works", force: :cascade do |t|
    t.bigint "user_id"
    t.string "is_working"
    t.string "work_type"
    t.string "work_position"
    t.string "business_name"
    t.string "company_name"
    t.string "company_address"
    t.string "company_acronym"
    t.string "type_of_business"
    t.string "area_of_business"
    t.string "business_address"
    t.string "business_acronym"
    t.string "business_related"
    t.string "line_of_busines"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "is_it_related", default: false
    t.boolean "is_gov_sect", default: false
    t.index ["user_id"], name: "index_works_on_user_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "alumni_mains", "users"
  add_foreign_key "event_posts", "users"
  add_foreign_key "job_posts", "users"
  add_foreign_key "users", "user_roles"
  add_foreign_key "users", "user_types"
  add_foreign_key "works", "users"
end
