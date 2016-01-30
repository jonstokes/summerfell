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

ActiveRecord::Schema.define(version: 20160130035123) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "billing_informations", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.uuid     "user_id",                                  null: false
    t.string   "billing_phone",                limit: 255
    t.string   "billing_token",                limit: 255, null: false
    t.string   "cc_full_name",                 limit: 255, null: false
    t.string   "cc_last_4",                    limit: 255, null: false
    t.string   "cc_expiry_month",              limit: 255, null: false
    t.string   "cc_expiry_year",               limit: 255, null: false
    t.string   "billing_address_company_name", limit: 255
    t.string   "billing_address_full_name",    limit: 255, null: false
    t.string   "billing_address_street",       limit: 255, null: false
    t.string   "billing_address_unit",         limit: 255
    t.string   "billing_address_city",         limit: 255, null: false
    t.string   "billing_address_state",        limit: 255, null: false
    t.string   "billing_address_zip_code",     limit: 255, null: false
    t.string   "billing_address_country",      limit: 255, null: false
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  add_index "billing_informations", ["user_id"], name: "index_billing_informations_on_user_id", using: :btree

  create_table "mac_addresses", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.uuid     "user_id"
    t.macaddr  "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "service_informations", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.uuid     "user_id",                                  null: false
    t.integer  "package",                                  null: false
    t.string   "service_phone",                limit: 255
    t.string   "service_address_company_name", limit: 255
    t.string   "service_address_full_name",    limit: 255, null: false
    t.string   "service_address_street",       limit: 255, null: false
    t.string   "service_address_unit",         limit: 255
    t.string   "service_address_city",         limit: 255, null: false
    t.string   "service_address_state",        limit: 255, null: false
    t.string   "service_address_zip_code",     limit: 255, null: false
    t.string   "service_address_country",      limit: 255, null: false
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  add_index "service_informations", ["user_id"], name: "index_service_informations_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
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
