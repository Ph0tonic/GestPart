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

ActiveRecord::Schema.define(version: 2018_08_14_151143) do

  create_table "compositors", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "kinds", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pdf_files", force: :cascade do |t|
    t.string "name"
    t.string "attachement"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pdf_voices", force: :cascade do |t|
    t.integer "pdf_file_id"
    t.integer "voice_id"
    t.integer "start_page"
    t.integer "nb_page"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pdf_file_id"], name: "index_pdf_voices_on_pdf_file_id"
    t.index ["voice_id"], name: "index_pdf_voices_on_voice_id"
  end

  create_table "pieces", force: :cascade do |t|
    t.string "title"
    t.integer "distribution"
    t.integer "no"
    t.text "divers"
    t.integer "publishing_house_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "storage_id"
    t.index ["publishing_house_id"], name: "index_pieces_on_publishing_house_id"
    t.index ["storage_id"], name: "index_pieces_on_storage_id"
  end

  create_table "pieces_kinds", id: false, force: :cascade do |t|
    t.integer "piece_id"
    t.integer "kind_id"
    t.index ["kind_id"], name: "index_pieces_kinds_on_kind_id"
    t.index ["piece_id"], name: "index_pieces_kinds_on_piece_id"
  end

  create_table "publishing_houses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "storage_types", force: :cascade do |t|
    t.string "name"
    t.string "icon"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "storages", force: :cascade do |t|
    t.string "name"
    t.string "memo"
    t.integer "order"
    t.integer "storage_id"
    t.integer "storage_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["storage_id"], name: "index_storages_on_storage_id"
    t.index ["storage_type_id"], name: "index_storages_on_storage_type_id"
  end

  create_table "voices", force: :cascade do |t|
    t.string "name"
    t.integer "number"
    t.integer "order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
