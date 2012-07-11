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

ActiveRecord::Schema.define(:version => 20120705075200) do

  create_table "answer_tables", :force => true do |t|
    t.string   "answer"
    t.float    "rating"
    t.integer  "user_table_id"
    t.integer  "question_table_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "forums", :force => true do |t|
    t.string   "user_name"
    t.string   "email"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "question_tables", :force => true do |t|
    t.string   "question"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions", :force => true do |t|
    t.string   "que_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "requester_tables", :force => true do |t|
    t.integer  "user_table_id"
    t.integer  "question_table_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_tables", :force => true do |t|
    t.string   "user_name"
    t.string   "email_id"
    t.string   "password"
    t.string   "user_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
