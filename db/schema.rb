# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090824214541) do

  create_table "bands", :force => true do |t|
    t.string   "name",        :default => ""
    t.string   "genre",       :default => ""
    t.text     "description", :default => ""
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bands_users", :id => false, :force => true do |t|
    t.integer  "band_id",    :null => false
    t.integer  "user_id",    :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gigs", :force => true do |t|
    t.integer  "venue_id",                    :null => false
    t.integer  "band_id",                     :null => false
    t.datetime "time"
    t.string   "event",       :default => ""
    t.string   "street",      :default => ""
    t.string   "city",        :default => ""
    t.string   "state",       :default => ""
    t.string   "zip_code",    :default => ""
    t.text     "description", :default => ""
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "specs", :force => true do |t|
    t.integer  "user_id",                    :null => false
    t.string   "first_name", :default => ""
    t.string   "last_name",  :default => ""
    t.string   "gender"
    t.date     "birthdate"
    t.date     "date"
    t.string   "occupation", :default => ""
    t.string   "city",       :default => ""
    t.string   "state",      :default => ""
    t.string   "zip_code",   :default => ""
    t.text     "bio",        :default => ""
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "screen_name"
    t.string   "email"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "authorization_token"
  end

  create_table "users_venues", :id => false, :force => true do |t|
    t.integer  "user_id",    :null => false
    t.integer  "venue_id",   :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "venues", :force => true do |t|
    t.string   "name",        :default => ""
    t.string   "street",      :default => ""
    t.string   "city",        :default => ""
    t.string   "state",       :default => ""
    t.string   "zip_code",    :default => ""
    t.text     "description", :default => ""
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
