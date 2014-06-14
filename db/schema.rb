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

ActiveRecord::Schema.define(version: 20140614145641) do

  create_table "friendrequests", force: true do |t|
    t.integer  "user_id"
    t.integer  "invitee_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "friendships", force: true do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.datetime "created_at"
    t.datetime "updated_at"
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "photo"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "videorequests", force: true do |t|
    t.integer  "user_id"
    t.integer  "usertwo_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status"
  end

  create_table "videos", force: true do |t|
    t.string   "youtube_id"
    t.string   "genre"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.string   "thumbnail"
    t.string   "description"
  end

  create_table "videosessions", force: true do |t|
    t.integer  "user_id"
    t.integer  "persontwo_id"
    t.string   "opentok_key"
    t.string   "opentok_secret"
    t.string   "token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "video_id"
    t.string   "status"
  end

end
