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

ActiveRecord::Schema.define(version: 20150804141742) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artists", force: :cascade do |t|
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
    t.string   "name"
    t.string   "role"
    t.string   "about"
    t.integer  "price"
    t.integer  "hour"
    t.string   "soundcloud_address"
    t.string   "youtube_address"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "display_name"
  end

  add_index "artists", ["email"], name: "index_artists_on_email", unique: true, using: :btree
  add_index "artists", ["reset_password_token"], name: "index_artists_on_reset_password_token", unique: true, using: :btree

  create_table "artists_events", id: false, force: :cascade do |t|
    t.integer "event_id",  null: false
    t.integer "artist_id", null: false
  end

  add_index "artists_events", ["artist_id", "event_id"], name: "index_artists_events_on_artist_id_and_event_id", using: :btree
  add_index "artists_events", ["event_id", "artist_id"], name: "index_artists_events_on_event_id_and_artist_id", using: :btree

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.datetime "time"
    t.string   "location"
    t.string   "artist"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date     "date"
  end

  create_table "hosts", force: :cascade do |t|
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
    t.string   "name"
  end

  add_index "hosts", ["email"], name: "index_hosts_on_email", unique: true, using: :btree
  add_index "hosts", ["reset_password_token"], name: "index_hosts_on_reset_password_token", unique: true, using: :btree

end
