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

ActiveRecord::Schema.define(version: 20180508100256) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.bigint "owner_id"
    t.string "title"
    t.text "description"
    t.text "requirements"
    t.text "image_data"
    t.integer "price", default: 0
    t.date "start_date"
    t.time "start_time"
    t.integer "duration", default: 3600
    t.string "street"
    t.string "suburb"
    t.string "state"
    t.string "country_code", default: "AU"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "location_details"
    t.integer "max_attendees", default: 10
    t.index ["owner_id"], name: "index_events_on_owner_id"
  end

  create_table "payments", force: :cascade do |t|
    t.bigint "user_id"
    t.string "charge"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "amount"
    t.string "description"
    t.index ["user_id"], name: "index_payments_on_user_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.bigint "user_id"
    t.text "tagline"
    t.text "bio"
    t.string "first_name"
    t.string "last_name"
    t.text "avatar_data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "website"
    t.boolean "email_show", default: true
    t.string "suburb"
    t.string "state"
    t.string "country_code"
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "tickets", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_tickets_on_event_id"
    t.index ["user_id"], name: "index_tickets_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.boolean "premium"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "stripe_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "events", "users", column: "owner_id"
  add_foreign_key "payments", "users"
  add_foreign_key "profiles", "users"
  add_foreign_key "tickets", "events"
  add_foreign_key "tickets", "users"
end
