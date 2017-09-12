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

ActiveRecord::Schema.define(version: 20170901214324) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: true do |t|
    t.string   "name"
    t.decimal  "market_value"
    t.integer  "manager_id"
    t.integer  "plan_id"
    t.string   "acctid",         null: false
    t.decimal  "committed"
    t.string   "asset_class"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "asset_class_id"
  end

  add_index "accounts", ["acctid"], name: "accounts_acctid_key", unique: true, using: :btree
  add_index "accounts", ["acctid"], name: "index_accounts_on_acctid", unique: true, using: :btree

  create_table "asset_classes", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "companies", force: true do |t|
    t.string   "name"
    t.string   "cusip"
    t.string   "ticker"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "consultants", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "custodians", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "managers", force: true do |t|
    t.string   "man_name",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "managers", ["man_name"], name: "index_managers_on_man_name", unique: true, using: :btree
  add_index "managers", ["man_name"], name: "managers_name_key", unique: true, using: :btree

  create_table "plans", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "trade_id"
    t.integer  "custodian_id"
    t.integer  "consultant_id"
  end

  create_table "securities", force: true do |t|
    t.string   "name"
    t.decimal  "market_value"
    t.string   "cusip"
    t.string   "ticker"
    t.integer  "account_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "shares"
    t.integer  "company_id"
  end

  create_table "trades", force: true do |t|
    t.string   "name"
    t.string   "name_short"
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
