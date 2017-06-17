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

ActiveRecord::Schema.define(version: 20170617124529) do

  create_table "brands", force: :cascade do |t|
    t.string   "brand",      limit: 255
    t.text     "brand_url",  limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",    limit: 4
  end

  create_table "comments", force: :cascade do |t|
    t.text     "comment",    limit: 65535
    t.integer  "item_id",    limit: 4
    t.integer  "user_id",    limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "favorites", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "item_id",    limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "images", force: :cascade do |t|
    t.text     "url",        limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", force: :cascade do |t|
    t.integer  "user_id",         limit: 4
    t.string   "name",            limit: 255
    t.integer  "type_id",         limit: 4
    t.text     "description",     limit: 65535
    t.text     "memo",            limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "image_id",        limit: 4
    t.text     "main_image",      limit: 65535
    t.integer  "brand_id",        limit: 4
    t.integer  "material_id",     limit: 4
    t.integer  "style_id",        limit: 4
    t.string   "image",           limit: 255
    t.integer  "favorites_count", limit: 4
    t.integer  "like_count",      limit: 4
  end

  create_table "likes", force: :cascade do |t|
    t.integer  "user_id",    limit: 4, null: false
    t.integer  "item_id",    limit: 4, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "likes", ["item_id"], name: "fk_rails_00045f60f7", using: :btree
  add_index "likes", ["user_id"], name: "fk_rails_1e09b5dabf", using: :btree

  create_table "materials", force: :cascade do |t|
    t.string   "material",   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "styles", force: :cascade do |t|
    t.string   "style",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "types", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type_name",  limit: 255
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255,   default: "", null: false
    t.string   "encrypted_password",     limit: 255,   default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,     default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.string   "nickname",               limit: 255
    t.text     "introduction",           limit: 65535
    t.string   "avater",                 limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "likes", "items"
  add_foreign_key "likes", "users"
end
