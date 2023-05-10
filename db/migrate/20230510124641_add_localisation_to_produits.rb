class AddLocalisationToProduits < ActiveRecord::Migration[7.0]
  def change
    add_column :produits, :country, :string
    add_column :produits, :state, :string
    add_column :produits, :city, :string
  end
end
