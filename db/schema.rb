# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 20_250_102_222_521) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'shop_reviews', force: :cascade do |t|
    t.bigint 'user_id', null: false
    t.bigint 'shop_id', null: false
    t.text 'comment'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['shop_id'], name: 'index_shop_reviews_on_shop_id'
    t.index ['user_id'], name: 'index_shop_reviews_on_user_id'
  end

  create_table 'shops', force: :cascade do |t|
    t.string 'name'
    t.text 'description'
    t.float 'latitude'
    t.float 'longitude'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'users', force: :cascade do |t|
    t.string 'name'
    t.string 'email'
    t.string 'password_digest'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  add_foreign_key 'shop_reviews', 'shops'
  add_foreign_key 'shop_reviews', 'users'
end
