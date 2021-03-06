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

ActiveRecord::Schema.define(version: 20150515044828) do

  create_table "ads", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "organization_id"
  end

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.string   "description"
    t.boolean  "copy"
    t.boolean  "photo"
    t.boolean  "print"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "magazine_id"
    t.integer  "issue_id"
    t.integer  "editor"
  end

  create_table "contacts", force: :cascade do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "email"
    t.string   "title"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "organization_id"
  end

  add_index "contacts", ["organization_id"], name: "index_contacts_on_organization_id"

  create_table "insertions", force: :cascade do |t|
    t.integer  "price"
    t.integer  "magazine_id"
    t.integer  "issue_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "ad_id"
  end

  create_table "issues", force: :cascade do |t|
    t.string   "title"
    t.date     "printdate"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "magazine_id"
  end

  add_index "issues", ["magazine_id"], name: "index_issues_on_magazine_id"

  create_table "magazines", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "organizations", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pins", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "user_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "pins", ["user_id"], name: "index_pins_on_user_id"

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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
