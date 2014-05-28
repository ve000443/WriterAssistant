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

ActiveRecord::Schema.define(version: 20140528153617) do

  create_table "anecdotes", force: true do |t|
    t.string   "subject"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "chapter_id"
    t.string   "content"
  end

  add_index "anecdotes", ["chapter_id"], name: "index_anecdotes_on_chapter_id"

  create_table "chapters", force: true do |t|
    t.integer  "number"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "chapters", ["number"], name: "index_chapters_on_number", unique: true

  create_table "character_relationships", force: true do |t|
    t.integer  "character_id"
    t.integer  "scene_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "character_relationships", ["character_id", "scene_id"], name: "index_character_relationships_on_character_id_and_scene_id", unique: true
  add_index "character_relationships", ["character_id"], name: "index_character_relationships_on_character_id"
  add_index "character_relationships", ["scene_id"], name: "index_character_relationships_on_scene_id"

  create_table "characters", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "scenes", force: true do |t|
    t.string   "content"
    t.string   "location"
    t.string   "period"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "chapter_id"
  end

  add_index "scenes", ["chapter_id"], name: "index_scenes_on_chapter_id"

  create_table "tag_relationships", force: true do |t|
    t.integer  "anecdote_id"
    t.integer  "tag_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tag_relationships", ["anecdote_id", "tag_id"], name: "index_tag_relationships_on_anecdote_id_and_tag_id", unique: true
  add_index "tag_relationships", ["anecdote_id"], name: "index_tag_relationships_on_anecdote_id"
  add_index "tag_relationships", ["tag_id"], name: "index_tag_relationships_on_tag_id"

  create_table "tags", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
