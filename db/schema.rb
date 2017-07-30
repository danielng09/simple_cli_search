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

ActiveRecord::Schema.define(version: 20170727061937) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "organizations", primary_key: "_id", force: :cascade do |t|
    t.string   "url"
    t.string   "external_id",    null: false
    t.string   "name"
    t.text     "domain_names",                array: true
    t.datetime "created_at"
    t.text     "details"
    t.boolean  "shared_tickets"
    t.text     "tags",                        array: true
  end

  add_index "organizations", ["_id"], name: "index_organizations_on__id", using: :btree
  add_index "organizations", ["external_id"], name: "index_organizations_on_external_id", using: :btree
  add_index "organizations", ["name"], name: "index_organizations_on_name", using: :btree
  add_index "organizations", ["shared_tickets"], name: "index_organizations_on_shared_tickets", using: :btree

  create_table "tickets", id: false, force: :cascade do |t|
    t.string   "_id",             null: false
    t.string   "url"
    t.string   "external_id",     null: false
    t.datetime "created_at"
    t.string   "type"
    t.string   "subject"
    t.string   "description"
    t.string   "priority"
    t.string   "status"
    t.integer  "submitter_id"
    t.integer  "assignee_id"
    t.text     "tags",                         array: true
    t.boolean  "has_incidents"
    t.datetime "due_at"
    t.string   "via"
    t.integer  "organization_id"
  end

  add_index "tickets", ["_id"], name: "index_tickets_on__id", using: :btree
  add_index "tickets", ["assignee_id"], name: "index_tickets_on_assignee_id", using: :btree
  add_index "tickets", ["external_id"], name: "index_tickets_on_external_id", using: :btree
  add_index "tickets", ["has_incidents"], name: "index_tickets_on_has_incidents", using: :btree
  add_index "tickets", ["organization_id"], name: "index_tickets_on_organization_id", using: :btree
  add_index "tickets", ["submitter_id"], name: "index_tickets_on_submitter_id", using: :btree

  create_table "users", primary_key: "_id", force: :cascade do |t|
    t.string   "url"
    t.string   "external_id",     null: false
    t.string   "name",            null: false
    t.string   "alias"
    t.datetime "created_at"
    t.boolean  "active"
    t.boolean  "verified"
    t.boolean  "shared"
    t.string   "locale"
    t.string   "timezone"
    t.datetime "last_login_at"
    t.string   "email"
    t.string   "phone",           null: false
    t.string   "signature"
    t.text     "tags",                         array: true
    t.boolean  "suspended"
    t.string   "role"
    t.integer  "organization_id"
  end

  add_index "users", ["_id"], name: "index_users_on__id", using: :btree
  add_index "users", ["active"], name: "index_users_on_active", using: :btree
  add_index "users", ["alias"], name: "index_users_on_alias", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["external_id"], name: "index_users_on_external_id", using: :btree
  add_index "users", ["name"], name: "index_users_on_name", using: :btree
  add_index "users", ["organization_id"], name: "index_users_on_organization_id", using: :btree
  add_index "users", ["phone"], name: "index_users_on_phone", using: :btree
  add_index "users", ["role"], name: "index_users_on_role", using: :btree
  add_index "users", ["shared"], name: "index_users_on_shared", using: :btree
  add_index "users", ["suspended"], name: "index_users_on_suspended", using: :btree
  add_index "users", ["verified"], name: "index_users_on_verified", using: :btree

  add_foreign_key "users", "organizations", primary_key: "_id"
end
