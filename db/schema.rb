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

ActiveRecord::Schema.define(:version => 20110218180953) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories_posts", :id => false, :force => true do |t|
    t.integer "category_id"
    t.integer "post_id"
  end

  create_table "comments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "conversation_id"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["conversation_id"], :name => "index_comments_on_conversation_id"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "conversations", :force => true do |t|
    t.string   "title"
    t.integer  "user_id"
    t.integer  "views"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "conversations", ["user_id"], :name => "index_conversations_on_user_id"

  create_table "documents", :force => true do |t|
    t.string   "name",              :limit => 100
    t.string   "description"
    t.boolean  "allow_download",                   :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
  end

  create_table "event_categories", :force => true do |t|
    t.string   "name",       :null => false
    t.string   "color",      :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", :force => true do |t|
    t.string   "name"
    t.datetime "start_at"
    t.datetime "end_at"
    t.boolean  "all_day",           :default => false
    t.boolean  "members_only",      :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
    t.integer  "event_category_id"
  end

  create_table "openings", :force => true do |t|
    t.string   "city"
    t.string   "school_district"
    t.string   "name"
    t.string   "phone"
    t.string   "email"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", :force => true do |t|
    t.string   "slug"
    t.string   "title",                           :null => false
    t.datetime "published_at"
    t.string   "excerpt"
    t.text     "body"
    t.string   "author"
    t.boolean  "members_only", :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "status"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                       :default => "",    :null => false
    t.string   "encrypted_password",           :limit => 128, :default => "",    :null => false
    t.string   "password_salt",                               :default => "",    :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                               :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "login"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "display_name"
    t.string   "business_name"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "zip_code"
    t.string   "phone_number"
    t.string   "cell_number"
    t.string   "fax_number"
    t.date     "date_of_birth"
    t.boolean  "board_member",                                :default => false
    t.boolean  "account_active",                              :default => true
    t.boolean  "admin",                                       :default => false
    t.string   "board_position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "board_title"
    t.boolean  "receive_emails",                              :default => true
    t.boolean  "include_in_directory",                        :default => true
    t.boolean  "display_address_in_directory",                :default => true
    t.boolean  "display_phone_in_directory",                  :default => true
    t.boolean  "backup_care",                                 :default => false
    t.text     "biography"
    t.string   "picture_url"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.boolean  "notify_on_new_post",                          :default => false, :null => false
  end

  add_index "users", ["login"], :name => "index_users_on_login", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
