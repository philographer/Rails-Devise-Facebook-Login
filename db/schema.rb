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

ActiveRecord::Schema.define(version: 20150817163652) do

  create_table "bobparties", force: :cascade do |t|
    t.string   "bobparty_title",                          null: false
    t.string   "bobparty_comment",                        null: false
    t.integer  "bobparty_menu"
    t.integer  "bobparty_member_nownum",      default: 1, null: false
    t.integer  "bobparty_member_maxnum",                  null: false
    t.string   "bobparty_firstmember_name"
    t.string   "bobparty_secondmember_name"
    t.string   "bobparty_thirdmember_name"
    t.string   "bobparty_forthmember_name"
    t.string   "bobparty_firstmember_email"
    t.string   "bobparty_secondmember_email"
    t.string   "bobparty_thirdmember_email"
    t.string   "bobparty_forthmember_email"
    t.string   "bobparty_date"
    t.string   "bobparty_time"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  create_table "report_articles", force: :cascade do |t|
    t.string   "report_title"
    t.string   "report_content"
    t.string   "report_username"
    t.string   "report_email"
    t.string   "report_image"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "image"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["image"], name: "index_users_on_image"
  add_index "users", ["name"], name: "index_users_on_name"
  add_index "users", ["provider"], name: "index_users_on_provider"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["uid"], name: "index_users_on_uid"

end
