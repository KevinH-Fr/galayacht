class AddProduitToSchedules < ActiveRecord::Migration[7.0]
  def change
    add_reference :schedules, :produit, null: true, foreign_key: true
  end
end
