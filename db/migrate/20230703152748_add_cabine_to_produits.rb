class AddCabineToProduits < ActiveRecord::Migration[7.0]
  def change
    add_column :produits, :nb_cabines, :integer
  end
end
