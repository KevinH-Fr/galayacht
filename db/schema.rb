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

ActiveRecord::Schema[7.0].define(version: 2023_05_17_203520) do
  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "bailleurs", force: :cascade do |t|
    t.string "prenom"
    t.string "nom"
    t.string "telephone"
    t.string "mail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_bailleurs_on_user_id"
  end

  create_table "destinations", force: :cascade do |t|
    t.string "nom"
    t.string "pays"
    t.string "ville"
    t.string "cp"
    t.string "port"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "preneurs", force: :cascade do |t|
    t.string "prenom"
    t.string "nom"
    t.string "telephone"
    t.string "mail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_preneurs_on_user_id"
  end

  create_table "produits", force: :cascade do |t|
    t.string "nom"
    t.string "type_produit"
    t.string "longueur"
    t.string "largeur"
    t.string "marque"
    t.string "model"
    t.integer "prixjour"
    t.integer "prixsemaine"
    t.integer "bailleur_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "country"
    t.string "state"
    t.string "city"
    t.integer "capacite"
    t.boolean "capitaine"
    t.integer "destination_id"
    t.index ["bailleur_id"], name: "index_produits_on_bailleur_id"
    t.index ["destination_id"], name: "index_produits_on_destination_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.integer "produit_id", null: false
    t.integer "preneur_id", null: false
    t.date "debutlocation"
    t.date "finlocation"
    t.integer "prix"
    t.string "statut"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["preneur_id"], name: "index_reservations_on_preneur_id"
    t.index ["produit_id"], name: "index_reservations_on_produit_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "bailleurs", "users"
  add_foreign_key "preneurs", "users"
  add_foreign_key "produits", "bailleurs"
  add_foreign_key "produits", "destinations"
  add_foreign_key "reservations", "preneurs"
  add_foreign_key "reservations", "produits"
end
