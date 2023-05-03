class ChangeTypeFieldToProduits < ActiveRecord::Migration[7.0]
  def change
    rename_column :produits, :type, :type_produit
  end
end
