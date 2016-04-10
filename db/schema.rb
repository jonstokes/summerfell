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

ActiveRecord::Schema.define(version: 20160409195155) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "guests", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.macaddr  "device_address",       null: false
    t.macaddr  "access_point_address", null: false
    t.uuid     "package_id",           null: false
    t.string   "email"
    t.boolean  "terms",                null: false
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "guests", ["device_address"], name: "index_guests_on_device_address", using: :btree

  create_table "hotspot_registrations", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.macaddr  "device_address",       null: false
    t.macaddr  "access_point_address", null: false
    t.uuid     "package_id",           null: false
    t.string   "email"
    t.string   "card_token"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "hotspot_registrations", ["device_address"], name: "index_hotspot_registrations_on_device_address", using: :btree

  create_table "packages", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "name",                                   null: false
    t.string   "charged_as",                             null: false
    t.money    "price_cents",                  scale: 2, null: false
    t.string   "currency",         limit: 255,           null: false
    t.text     "description",                            null: false
    t.integer  "duration_minutes",                       null: false
    t.integer  "limit_up"
    t.integer  "limit_down"
    t.integer  "limit_quota"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  create_table "users", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
