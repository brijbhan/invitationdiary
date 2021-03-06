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

ActiveRecord::Schema.define(version: 20171219180707) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "invitations", force: :cascade do |t|
    t.integer  "party_id"
    t.text     "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["party_id"], name: "index_invitations_on_party_id", using: :btree
  end

  create_table "invitees", force: :cascade do |t|
    t.integer  "party_id"
    t.string   "name"
    t.string   "mobile"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.boolean  "is_invited", default: false
    t.integer  "call_count", default: 0
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["party_id"], name: "index_invitees_on_party_id", using: :btree
  end

  create_table "parties", force: :cascade do |t|
    t.integer  "user_id"
    t.date     "start_at"
    t.date     "end_at"
    t.text     "venue"
    t.boolean  "is_active",  default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.float    "lat"
    t.float    "lng"
    t.string   "title"
    t.index ["lat", "lng"], name: "index_parties_on_lat_and_lng", using: :btree
    t.index ["user_id"], name: "index_parties_on_user_id", using: :btree
    t.index ["venue"], name: "index_parties_on_venue", using: :btree
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
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
