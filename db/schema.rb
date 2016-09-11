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

ActiveRecord::Schema.define(:version => 20130620135205) do

  create_table "detentions", :force => true do |t|
    t.date     "detention_date"
    t.date     "incident_date"
    t.text     "reason"
    t.string   "administrator"
    t.integer  "student_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "previous_actions"
    t.string   "notes"
  end

  add_index "detentions", ["student_id"], :name => "index_detentions_on_student_id"

  create_table "gradelevels", :force => true do |t|
    t.date     "gldate"
    t.date     "glincident_date"
    t.text     "glreason"
    t.string   "glteacher"
    t.integer  "student_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "gradelevels", ["student_id"], :name => "index_gradelevels_on_student_id"

  create_table "inschools", :force => true do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.string   "days"
    t.date     "incident_date"
    t.text     "reason"
    t.string   "administrator"
    t.integer  "student_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "previous_actions"
    t.string   "notes"
  end

  add_index "inschools", ["student_id"], :name => "index_inschools_on_student_id"

  create_table "lunchdetentions", :force => true do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.string   "days"
    t.date     "incident_date"
    t.text     "reason"
    t.string   "administrator"
    t.integer  "student_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "lunchdetentions", ["student_id"], :name => "index_lunchdetentions_on_student_id"

  create_table "searches", :force => true do |t|
    t.string   "keywords"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "teacher"
    t.string   "last_name"
    t.string   "first_name"
    t.string   "grade"
  end

  create_table "students", :force => true do |t|
    t.string   "last_name"
    t.string   "first_name"
    t.string   "grade"
    t.integer  "stu_id"
    t.string   "teacher"
    t.string   "parent_name"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "phone"
    t.string   "teacheremail"
  end

  create_table "suspensions", :force => true do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.string   "days"
    t.date     "incident_date"
    t.text     "reason"
    t.string   "administrator"
    t.integer  "student_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "previous_actions"
    t.string   "notes"
  end

  add_index "suspensions", ["student_id"], :name => "index_suspensions_on_student_id"

end
