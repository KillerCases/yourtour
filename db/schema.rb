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

ActiveRecord::Schema.define(version: 20150405185253) do

  create_table "bookings", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "calendar_id"
    t.integer  "user_id"
    t.string   "stripe_customer_token"
  end

  create_table "calendars", force: true do |t|
    t.datetime "calendar_datetime"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "tour_id"
  end

  create_table "tour_cities", force: true do |t|
    t.string   "city"
    t.string   "country"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tour_guides", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "tour_guide_image_file_name"
    t.string   "tour_guide_image_content_type"
    t.integer  "tour_guide_image_file_size"
    t.datetime "tour_guide_image_updated_at"
  end

  create_table "tour_prices", force: true do |t|
    t.string   "name"
    t.integer  "duration"
    t.decimal  "price_adult"
    t.decimal  "price_child"
    t.string   "currency"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tours", force: true do |t|
    t.datetime "created_at"
    t.string   "name"
    t.string   "short_description"
    t.datetime "updated_at"
    t.integer  "tour_guide_id"
    t.integer  "tour_city_id"
    t.integer  "tour_price_id"
    t.string   "long_description"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "meeting_point_description"
    t.integer  "min_customer_threshold"
    t.string   "tour_image_file_name"
    t.string   "tour_image_content_type"
    t.integer  "tour_image_file_size"
    t.datetime "tour_image_updated_at"
    t.string   "address"
  end

  create_table "users", force: true do |t|
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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
