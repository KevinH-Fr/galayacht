class CreateOccupationProduits < ActiveRecord::Migration[7.0]
  def change
    create_table :occupation_produits do |t|
      t.date :debut
      t.date :fin
      t.references :produit, null: false, foreign_key: true

      t.timestamps
    end
  end
end
