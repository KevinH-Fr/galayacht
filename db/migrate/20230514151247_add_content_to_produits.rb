class AddContentToProduits < ActiveRecord::Migration[7.0]
  def change
    add_column :produits, :capacite, :integer
    add_column :produits, :capitaine, :boolean
  end
end
