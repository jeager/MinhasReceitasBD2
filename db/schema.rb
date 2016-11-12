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

ActiveRecord::Schema.define(version: 20161112213820) do

  create_table "Books_Recipes", id: false, force: :cascade do |t|
    t.integer "book_id",   null: false
    t.integer "recipe_id", null: false
  end

  create_table "Chefs_Recipes", id: false, force: :cascade do |t|
    t.integer "recipe_id", null: false
    t.integer "chef_id",   null: false
  end

  create_table "Chefs_Restaurants", id: false, force: :cascade do |t|
    t.integer "chef_id",       null: false
    t.integer "restaurant_id", null: false
  end

  create_table "addresses", force: :cascade do |t|
    t.string   "street"
    t.integer  "number"
    t.string   "complement"
    t.integer  "cep"
    t.integer  "district_id"
    t.string   "address_type"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "employee_id"
    t.integer  "restaurant_id"
    t.integer  "uf_id"
    t.integer  "editor_id"
  end

  add_index "addresses", ["district_id"], name: "index_addresses_on_district_id"
  add_index "addresses", ["editor_id"], name: "index_addresses_on_editor_id"
  add_index "addresses", ["employee_id"], name: "index_addresses_on_employee_id"
  add_index "addresses", ["restaurant_id"], name: "index_addresses_on_restaurant_id"
  add_index "addresses", ["uf_id"], name: "index_addresses_on_uf_id"

  create_table "books", force: :cascade do |t|
    t.integer  "isbn"
    t.integer  "editor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "books", ["editor_id"], name: "index_books_on_editor_id"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "chefs", force: :cascade do |t|
    t.integer  "employee_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "chefs", ["employee_id"], name: "index_chefs_on_employee_id"

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.integer  "uf_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "cities", ["uf_id"], name: "index_cities_on_uf_id"

  create_table "districts", force: :cascade do |t|
    t.string   "name"
    t.integer  "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "districts", ["city_id"], name: "index_districts_on_city_id"

  create_table "editors", force: :cascade do |t|
    t.string   "name"
    t.integer  "cnpj"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string   "name"
    t.integer  "rg"
    t.integer  "enrollment"
    t.string   "sex"
    t.float    "salary"
    t.integer  "cpf"
    t.string   "nationality"
    t.string   "scholarity"
    t.string   "father_name"
    t.string   "mother_name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "employee_type"
  end

  create_table "evaluations", force: :cascade do |t|
    t.integer  "taster_id"
    t.integer  "recipe_id"
    t.integer  "grade"
    t.date     "evaluation_date"
    t.string   "comments"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "evaluations", ["recipe_id"], name: "index_evaluations_on_recipe_id"
  add_index "evaluations", ["taster_id"], name: "index_evaluations_on_taster_id"

  create_table "ingredients", force: :cascade do |t|
    t.string   "name"
    t.string   "measure"
    t.date     "fabrication_date"
    t.date     "expire_in"
    t.string   "description"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "recipes", force: :cascade do |t|
    t.string   "title"
    t.integer  "portions"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "category_id"
  end

  add_index "recipes", ["category_id"], name: "index_recipes_on_category_id"

  create_table "recipes_ingredients", force: :cascade do |t|
    t.integer  "recipe_id"
    t.integer  "ingredient_id"
    t.integer  "quantity"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "restaurants", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "steps", force: :cascade do |t|
    t.string   "description"
    t.integer  "time"
    t.integer  "recipe_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "steps", ["recipe_id"], name: "index_steps_on_recipe_id"

  create_table "tasters", force: :cascade do |t|
    t.integer  "employee_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "tasters", ["employee_id"], name: "index_tasters_on_employee_id"

  create_table "ufs", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
