# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_07_25_100351) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "audios", force: :cascade do |t|
    t.string "url"
    t.bigint "song_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["song_id"], name: "index_audios_on_song_id"
  end

  create_table "chords", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "lyric_chords", force: :cascade do |t|
    t.integer "position"
    t.bigint "chord_id", null: false
    t.bigint "lyric_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["chord_id"], name: "index_lyric_chords_on_chord_id"
    t.index ["lyric_id"], name: "index_lyric_chords_on_lyric_id"
  end

  create_table "lyrics", force: :cascade do |t|
    t.string "text"
    t.bigint "song_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["song_id"], name: "index_lyrics_on_song_id"
  end

  create_table "songs", force: :cascade do |t|
    t.string "name"
    t.string "skill_level"
    t.bigint "teacher_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["teacher_id"], name: "index_songs_on_teacher_id"
  end

  create_table "student_songs", force: :cascade do |t|
    t.bigint "song_id", null: false
    t.bigint "student_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["song_id"], name: "index_student_songs_on_song_id"
    t.index ["student_id"], name: "index_student_songs_on_student_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "skill_level"
    t.bigint "teacher_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["teacher_id"], name: "index_students_on_teacher_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "phone"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "videos", force: :cascade do |t|
    t.string "url"
    t.bigint "song_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["song_id"], name: "index_videos_on_song_id"
  end

  add_foreign_key "audios", "songs"
  add_foreign_key "lyric_chords", "chords"
  add_foreign_key "lyric_chords", "lyrics"
  add_foreign_key "lyrics", "songs"
  add_foreign_key "songs", "teachers"
  add_foreign_key "student_songs", "songs"
  add_foreign_key "student_songs", "students"
  add_foreign_key "students", "teachers"
  add_foreign_key "videos", "songs"
end
