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

ActiveRecord::Schema.define(version: 20161026133834) do

  create_table "admin_categories", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "description", limit: 255
    t.integer  "ordem",       limit: 4
    t.boolean  "published",               default: true
    t.boolean  "active",                  default: true
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "father_id",   limit: 4
  end

  create_table "admin_columnists", force: :cascade do |t|
    t.string   "name",                          limit: 255
    t.string   "description",                   limit: 255
    t.boolean  "published",                                 default: true
    t.boolean  "active",                                    default: true
    t.datetime "created_at",                                               null: false
    t.datetime "updated_at",                                               null: false
    t.string   "admin_columnists_file_name",    limit: 255
    t.string   "admin_columnists_content_type", limit: 255
    t.integer  "admin_columnists_file_size",    limit: 4
    t.datetime "admin_columnists_updated_at"
  end

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
    t.string   "name",                           limit: 255
    t.text     "description",                    limit: 65535
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.integer  "visualizations",                 limit: 4
    t.string   "img_enterprise_file_name",       limit: 255
    t.string   "img_enterprise_content_type",    limit: 255
    t.integer  "img_enterprise_file_size",       limit: 4
    t.datetime "img_enterprise_updated_at"
    t.string   "banner_enterprise_file_name",    limit: 255
    t.string   "banner_enterprise_content_type", limit: 255
    t.integer  "banner_enterprise_file_size",    limit: 4
    t.datetime "banner_enterprise_updated_at"
    t.string   "specialties",                    limit: 255
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
    t.text     "description",                limit: 65535
    t.integer  "ordem",                      limit: 4,     default: 0,    null: false
    t.boolean  "active",                                   default: true, null: false
    t.boolean  "published",                                default: true, null: false
    t.datetime "created_at",                                              null: false
    t.datetime "updated_at",                                              null: false
    t.string   "image_article_file_name",    limit: 255
    t.string   "image_article_content_type", limit: 255
    t.integer  "image_article_file_size",    limit: 4
    t.datetime "image_article_updated_at"
    t.integer  "columnist_id",               limit: 4
  end

  create_table "articles_categories", id: false, force: :cascade do |t|
    t.integer "category_id", limit: 4, null: false
    t.integer "article_id",  limit: 4, null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "description", limit: 255
    t.integer  "ordem",       limit: 4
    t.boolean  "published",               default: true
    t.boolean  "active",                  default: true
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "father_id",   limit: 4
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",    limit: 255, null: false
    t.string   "data_content_type", limit: 255
    t.integer  "data_file_size",    limit: 4
    t.string   "data_fingerprint",  limit: 255
    t.integer  "assetable_id",      limit: 4
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width",             limit: 4
    t.integer  "height",            limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "comments", force: :cascade do |t|
    t.integer  "feed_id",    limit: 4
    t.integer  "user_id",    limit: 4
    t.text     "comment",    limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "comments_feeds", force: :cascade do |t|
    t.integer  "feed_id",    limit: 4
    t.integer  "user_id",    limit: 4
    t.text     "comment",    limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "feeds", force: :cascade do |t|
    t.integer  "object_id",   limit: 4
    t.string   "object_type", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "likes", force: :cascade do |t|
    t.integer  "feed_id",    limit: 4
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "portfolios", force: :cascade do |t|
    t.string   "title",                      limit: 255
    t.integer  "ordem",                      limit: 4
    t.integer  "enterprise_id",              limit: 4
    t.boolean  "active",                                 default: true
    t.boolean  "published",                              default: true
    t.datetime "created_at",                                            null: false
    t.datetime "updated_at",                                            null: false
    t.string   "portfolio_img_file_name",    limit: 255
    t.string   "portfolio_img_content_type", limit: 255
    t.integer  "portfolio_img_file_size",    limit: 4
    t.datetime "portfolio_img_updated_at"
  end

  create_table "rails", force: :cascade do |t|
    t.string   "destroy",       limit: 255
    t.string   "comments_feed", limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
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

  add_index "taggings", ["context"], name: "index_taggings_on_context", using: :btree
  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree
  add_index "taggings", ["tag_id"], name: "index_taggings_on_tag_id", using: :btree
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree
  add_index "taggings", ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy", using: :btree
  add_index "taggings", ["taggable_id"], name: "index_taggings_on_taggable_id", using: :btree
  add_index "taggings", ["taggable_type"], name: "index_taggings_on_taggable_type", using: :btree
  add_index "taggings", ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type", using: :btree
  add_index "taggings", ["tagger_id"], name: "index_taggings_on_tagger_id", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string  "name",           limit: 255
    t.integer "taggings_count", limit: 4,   default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                limit: 255
    t.string   "name",                 limit: 255
    t.string   "crypted_password",     limit: 255
    t.string   "password_salt",        limit: 255
    t.string   "persistence_token",    limit: 255
    t.integer  "login_count",          limit: 4
    t.integer  "failed_login_count",   limit: 4
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip",     limit: 255
    t.string   "last_login_ip",        limit: 255
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "last_name",            limit: 255
    t.string   "birthdate",            limit: 255
    t.string   "company",              limit: 255
    t.string   "services_performed",   limit: 255
    t.string   "cep",                  limit: 255
    t.string   "street",               limit: 255
    t.string   "number",               limit: 255
    t.string   "neighborhood",         limit: 255
    t.string   "city",                 limit: 255
    t.string   "state",                limit: 255
    t.string   "picture_file_name",    limit: 255
    t.string   "picture_content_type", limit: 255
    t.integer  "picture_file_size",    limit: 4
    t.datetime "picture_updated_at"
  end

end
