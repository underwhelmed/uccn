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

ActiveRecord::Schema.define(:version => 20110816224728) do

  create_table "categories", :force => true do |t|
    t.string    "name"
    t.string    "slug"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "categories_posts", :id => false, :force => true do |t|
    t.integer "category_id"
    t.integer "post_id"
  end

  create_table "comments", :force => true do |t|
    t.integer   "user_id"
    t.integer   "conversation_id"
    t.text      "body"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  add_index "comments", ["conversation_id"], :name => "index_comments_on_conversation_id"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "conversations", :force => true do |t|
    t.string    "title"
    t.integer   "user_id"
    t.integer   "views"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  add_index "conversations", ["user_id"], :name => "index_conversations_on_user_id"

  create_table "delayed_jobs", :force => true do |t|
    t.integer   "priority",   :default => 0
    t.integer   "attempts",   :default => 0
    t.text      "handler"
    t.text      "last_error"
    t.timestamp "run_at"
    t.timestamp "locked_at"
    t.timestamp "failed_at"
    t.string    "locked_by"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"

  create_table "documents", :force => true do |t|
    t.string    "name",              :limit => 100
    t.string    "description"
    t.boolean   "allow_download",                   :default => true
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.string    "file_file_name"
    t.string    "file_content_type"
    t.integer   "file_file_size"
    t.timestamp "file_updated_at"
  end

  create_table "event_categories", :force => true do |t|
    t.string    "name",       :null => false
    t.string    "color",      :null => false
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "events", :force => true do |t|
    t.string    "name"
    t.timestamp "start_at"
    t.timestamp "end_at"
    t.boolean   "all_day",           :default => false
    t.boolean   "members_only",      :default => false
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.text      "description"
    t.integer   "event_category_id"
  end

  create_table "memberships", :force => true do |t|
    t.string   "first_name",           :null => false
    t.string   "last_name",            :null => false
    t.string   "business_name",        :null => false
    t.string   "address_1",            :null => false
    t.string   "address_2",            :null => false
    t.string   "city",                 :null => false
    t.string   "state",                :null => false
    t.string   "postal_code",          :null => false
    t.string   "email",                :null => false
    t.string   "phone_number",         :null => false
    t.string   "date_of_birth",        :null => false
    t.string   "ip_address",           :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "new_member"
    t.string   "member_type"
    t.string   "license_type"
    t.boolean  "interest_website"
    t.boolean  "interest_networking"
    t.boolean  "interest_cpr"
    t.boolean  "interest_backup"
    t.boolean  "interest_meetings"
    t.boolean  "interest_field_trips"
    t.string   "interest_other"
    t.string   "topic_requests"
    t.boolean  "publish_address"
    t.string   "license_number"
    t.string   "referral_info"
    t.string   "christmas"
    t.string   "manna"
    t.string   "membership"
    t.string   "public_relations"
    t.string   "token"
  end

  create_table "messages", :force => true do |t|
    t.string   "name",       :null => false
    t.string   "email",      :null => false
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "openings", :force => true do |t|
    t.string    "city"
    t.string    "school_district"
    t.string    "name"
    t.string    "phone"
    t.string    "email"
    t.text      "description"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "posts", :force => true do |t|
    t.string    "slug"
    t.string    "title",                           :null => false
    t.timestamp "published_at"
    t.string    "excerpt"
    t.text      "body"
    t.string    "author"
    t.boolean   "members_only", :default => false
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.integer   "status"
  end

  create_table "users", :force => true do |t|
    t.string    "email",                                       :default => "",    :null => false
    t.string    "encrypted_password",           :limit => 128, :default => "",    :null => false
    t.string    "password_salt",                               :default => "",    :null => false
    t.string    "reset_password_token"
    t.string    "remember_token"
    t.timestamp "remember_created_at"
    t.integer   "sign_in_count",                               :default => 0
    t.timestamp "current_sign_in_at"
    t.timestamp "last_sign_in_at"
    t.string    "current_sign_in_ip"
    t.string    "last_sign_in_ip"
    t.string    "login"
    t.string    "first_name"
    t.string    "last_name"
    t.string    "display_name"
    t.string    "business_name"
    t.string    "address1"
    t.string    "address2"
    t.string    "city"
    t.string    "state"
    t.string    "zip_code"
    t.string    "phone_number"
    t.string    "cell_number"
    t.string    "fax_number"
    t.date      "date_of_birth"
    t.boolean   "board_member",                                :default => false
    t.boolean   "account_active",                              :default => true
    t.boolean   "admin",                                       :default => false
    t.string    "board_position"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.string    "board_title"
    t.boolean   "receive_emails",                              :default => true
    t.boolean   "include_in_directory",                        :default => true
    t.boolean   "display_address_in_directory",                :default => true
    t.boolean   "display_phone_in_directory",                  :default => true
    t.boolean   "backup_care",                                 :default => false
    t.text      "biography"
    t.string    "picture_url"
    t.string    "photo_file_name"
    t.string    "photo_content_type"
    t.integer   "photo_file_size"
    t.timestamp "photo_updated_at"
    t.boolean   "notify_on_new_post",                          :default => false, :null => false
  end

  add_index "users", ["login"], :name => "index_users_on_login", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
