class AddLocationVenteToProduits < ActiveRecord::Migration[7.0]
  def change
    add_column :produits, :location, :boolean
    add_column :produits, :vente, :boolean
  end
end
