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

ActiveRecord::Schema.define(:version => 20100629024852) do

  create_table "child_images", :force => true do |t|
    t.integer  "child_id"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photograph_file_name"
    t.string   "photograph_content_type"
    t.integer  "photograph_file_size"
    t.datetime "photograph_updated_at"
    t.integer  "photograph_primary",      :limit => 1
  end

  create_table "child_teachers", :force => true do |t|
    t.integer  "child_id"
    t.integer  "teacher_id"
    t.date     "valid_from"
    t.date     "valid_until"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "child_updates", :force => true do |t|
    t.integer  "child_id"
    t.text     "notes"
    t.date     "update_dt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "children", :force => true do |t|
    t.string   "first"
    t.string   "last"
    t.string   "middle"
    t.string   "gender"
    t.string   "classroom"
    t.string   "village"
    t.string   "teacher"
    t.string   "sponsor_code"
    t.string   "father"
    t.string   "mother"
    t.string   "lives_with"
    t.string   "academic"
    t.string   "attendance"
    t.string   "does_homework"
    t.string   "favorite_season"
    t.integer  "age"
    t.integer  "grade"
    t.integer  "sisters"
    t.integer  "brothers"
    t.integer  "cousins"
    t.boolean  "sponsored"
    t.boolean  "birth_cert"
    t.date     "birthdate"
    t.date     "sponsor_begin"
    t.date     "sponsor_expire"
    t.text     "occupation"
    t.text     "helps_with"
    t.text     "activities"
    t.text     "favorite_bibleverse"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "families", :force => true do |t|
    t.string   "name"
    t.date     "sponsor_begin"
    t.date     "sponsor_expire"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "family_children", :force => true do |t|
    t.integer  "family_id"
    t.integer  "child_id"
    t.date     "update_dt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "family_images", :force => true do |t|
    t.integer  "family_id"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photograph_file_name"
    t.string   "photograph_content_type"
    t.integer  "photograph_file_size"
    t.datetime "photograph_updated_at"
    t.integer  "photograph_primary",      :limit => 1
  end

  create_table "family_updates", :force => true do |t|
    t.integer  "family_id"
    t.text     "notes"
    t.date     "update_dt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teachers", :force => true do |t|
    t.string   "first"
    t.string   "last"
    t.string   "gender"
    t.string   "village"
    t.integer  "grade"
    t.string   "school"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
