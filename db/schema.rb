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

ActiveRecord::Schema.define(version: 20131005025700) do

  create_table "characters", force: true do |t|
    t.string   "name"
    t.string   "realm"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cls"
    t.integer  "race"
    t.integer  "spec"
    t.integer  "achvpts"
    t.integer  "arena2"
    t.integer  "arena3"
    t.integer  "arena5"
    t.integer  "cr"
    t.integer  "ilvl"
    t.integer  "role"
    t.integer  "user_id"
    t.integer  "pvpresil"
    t.integer  "pvppower"
    t.integer  "gender"
    t.string   "specialization"
    t.integer  "achv2"
    t.integer  "achv3"
    t.integer  "achv5"
    t.integer  "hk"
    t.string   "bgtitle"
    t.boolean  "arenamaster"
    t.integer  "health"
    t.integer  "str"
    t.integer  "agi"
    t.integer  "int"
    t.integer  "spr"
    t.integer  "ap"
    t.integer  "sp"
    t.integer  "mastery"
    t.float    "masteryp"
    t.integer  "crit"
    t.float    "critp"
    t.integer  "haste"
    t.float    "hastep"
    t.integer  "armor"
  end

  add_index "characters", ["user_id"], name: "index_characters_on_user_id"

  create_table "listings", force: true do |t|
    t.string   "description"
    t.string   "role"
    t.boolean  "listSkype"
    t.boolean  "listBattletag"
    t.string   "toon"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "btag"
  end

  add_index "listings", ["user_id"], name: "index_listings_on_user_id"

  create_table "teams", force: true do |t|
    t.string   "name"
    t.string   "role1"
    t.string   "role2"
    t.string   "role3"
    t.string   "role4"
    t.string   "role5"
    t.string   "role6"
    t.string   "role7"
    t.string   "role8"
    t.string   "role9"
    t.string   "role10"
    t.integer  "rbgdate"
    t.integer  "rbghour"
    t.integer  "rbgmin"
    t.integer  "rbgzone"
    t.integer  "rbgdurationHour"
    t.integer  "rbgdurationMin"
    t.boolean  "isAvailable"
    t.boolean  "recurs"
    t.integer  "rolesNeeded"
    t.integer  "classesNeeded"
    t.boolean  "listed"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "mincr"
    t.integer  "minilvl"
    t.integer  "mintitle"
    t.integer  "min2s"
    t.integer  "min3s"
    t.integer  "min5s"
  end

  add_index "teams", ["user_id"], name: "index_teams_on_user_id"

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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "skype"
    t.string   "battletag"
    t.boolean  "haveMic"
    t.text     "addons"
    t.text     "aboutMe"
    t.integer  "skill"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
