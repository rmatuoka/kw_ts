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

ActiveRecord::Schema.define(version: 20160817185052) do

  create_table "admin_customers", force: :cascade do |t|
    t.string   "title",                     limit: 255
    t.text     "description",               limit: 65535
    t.boolean  "published",                               default: true, null: false
    t.boolean  "active",                                  default: true, null: false
    t.datetime "created_at",                                             null: false
    t.datetime "updated_at",                                             null: false
    t.string   "company_logo_file_name",    limit: 255
    t.string   "company_logo_content_type", limit: 255
    t.integer  "company_logo_file_size",    limit: 4
    t.datetime "company_logo_updated_at"
    t.text     "services_performed",        limit: 65535
    t.integer  "ordem",                     limit: 4
  end

  create_table "admin_enterprises", force: :cascade do |t|
    t.string   "name",           limit: 255
    t.text     "description",    limit: 65535
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "visualizations", limit: 4
  end

  create_table "admin_highlights", force: :cascade do |t|
    t.string   "title",                        limit: 255
    t.string   "subtitle",                     limit: 255
    t.integer  "ordem",                        limit: 4
    t.boolean  "active"
    t.boolean  "published"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.string   "image_highlight_file_name",    limit: 255
    t.string   "image_highlight_content_type", limit: 255
    t.integer  "image_highlight_file_size",    limit: 4
    t.datetime "image_highlight_updated_at"
    t.string   "link",                         limit: 255
  end

  create_table "admin_organizations", force: :cascade do |t|
    t.string   "title",               limit: 255
    t.string   "description",         limit: 255
    t.datetime "organization_start"
    t.datetime "organization_finish"
    t.boolean  "active",                          default: true, null: false
    t.boolean  "published",                       default: true, null: false
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
  end

  create_table "articles", force: :cascade do |t|
    t.string   "title",                      limit: 255
    t.string   "subtitle",                   limit: 255
    t.string   "description",                limit: 255
    t.integer  "ordem",                      limit: 4,   default: 0,    null: false
    t.boolean  "active",                                 default: true, null: false
    t.boolean  "published",                              default: true, null: false
    t.datetime "created_at",                                            null: false
    t.datetime "updated_at",                                            null: false
    t.string   "image_article_file_name",    limit: 255
    t.string   "image_article_content_type", limit: 255
    t.integer  "image_article_file_size",    limit: 4
    t.datetime "image_article_updated_at"
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name",              limit: 40
    t.string   "authorizable_type", limit: 40
    t.integer  "authorizable_id",   limit: 4
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "roles_users", id: false, force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "role_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "sessions", force: :cascade do |t|
    t.string   "session_id", limit: 255,   null: false
    t.text     "data",       limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id",        limit: 4
    t.integer  "taggable_id",   limit: 4
    t.string   "taggable_type", limit: 255
    t.integer  "tagger_id",     limit: 4
    t.string   "tagger_type",   limit: 255
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], name: "index_taggings_on_tag_id", using: :btree
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string "name", limit: 255
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",              limit: 255
    t.string   "name",               limit: 255
    t.string   "crypted_password",   limit: 255
    t.string   "password_salt",      limit: 255
    t.string   "persistence_token",  limit: 255
    t.integer  "login_count",        limit: 4
    t.integer  "failed_login_count", limit: 4
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip",   limit: 255
    t.string   "last_login_ip",      limit: 255
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

end
