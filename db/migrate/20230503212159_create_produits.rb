class CreateProduits < ActiveRecord::Migration[7.0]
  def change
    create_table :produits do |t|
      t.string :nom
      t.string :type
      t.string :longueur
      t.string :largeur
      t.string :marque
      t.string :model
      t.integer :prixjour
      t.integer :prixsemaine
      t.references :bailleur, null: false, foreign_key: true

      t.timestamps
    end
  end
end
