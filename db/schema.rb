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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20150131120310) do

  create_table "admin_users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "fitment_center_users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.integer  "fitment_center_id"
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "fitment_center_users", ["email"], :name => "index_fitment_center_users_on_email", :unique => true
  add_index "fitment_center_users", ["fitment_center_id"], :name => "index_fitment_center_users_on_fitment_center_id"
  add_index "fitment_center_users", ["reset_password_token"], :name => "index_fitment_center_users_on_reset_password_token", :unique => true

  create_table "fitment_centers", :force => true do |t|
    t.string   "company_name"
    t.string   "tel_number"
    t.string   "fax_number"
    t.text     "physical_address"
    t.string   "contact_name"
    t.string   "contact_email_address"
    t.string   "contact_cell_number"
    t.string   "postal_address"
    t.integer  "registered_by"
    t.boolean  "verified"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

end