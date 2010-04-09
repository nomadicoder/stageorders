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

ActiveRecord::Schema.define(:version => 20100404223149) do

  create_table "blogs", :force => true do |t|
    t.integer  "team_id"
    t.string   "host_url"
    t.string   "access_path"
    t.string   "blog_url"
    t.string   "results_url"
    t.string   "access_url"
    t.string   "username"
    t.string   "password"
    t.string   "blog_number"
    t.integer  "results_post_number"
    t.string   "category"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "runner_status_codes", :force => true do |t|
    t.float    "sequence"
    t.string   "short_code"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "runners", :force => true do |t|
    t.integer  "stage_id"
    t.string   "name"
    t.time     "estimated_pace",        :default => '2000-01-01 00:00:00'
    t.boolean  "completed"
    t.time     "actual_time",           :default => '2000-01-01 00:00:00'
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "team_id",               :default => 0
    t.integer  "runner_status_code_id", :default => 1
  end

  create_table "stage_status_codes", :force => true do |t|
    t.string   "short_code"
    t.string   "description"
    t.float    "sequence"
    t.integer  "runner_status_code_id"
    t.integer  "support_status_code_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stage_statuses", :force => true do |t|
    t.integer  "team_id"
    t.integer  "stage_id"
    t.integer  "runner_id"
    t.integer  "support_unit_id"
    t.integer  "runner_status_code_id"
    t.integer  "support_status_code_id"
    t.integer  "stage_status_code_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stages", :force => true do |t|
    t.integer  "number"
    t.string   "landmark"
    t.decimal  "miles"
    t.integer  "difficulty"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "support_status_codes", :force => true do |t|
    t.float    "sequence"
    t.string   "short_code"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "support_types", :force => true do |t|
    t.string   "short_code"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "support_units", :force => true do |t|
    t.integer  "team_id"
    t.integer  "support_type_id"
    t.string   "tac_callsign"
    t.string   "ham_callsign"
    t.integer  "support_status_code_id"
    t.integer  "current_stage_id"
    t.float    "location_lat"
    t.float    "location_lon"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", :force => true do |t|
    t.integer  "number"
    t.string   "name"
    t.string   "short_name"
    t.datetime "start_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "hashed_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
