class AddPrixventenvPrixventefaiToProduits < ActiveRecord::Migration[7.0]
  def change
    add_column :produits, :prixventenv, :decimal
    add_column :produits, :prixventefai, :decimal
  end
end
