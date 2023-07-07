class ChangeTypeFieldProduits < ActiveRecord::Migration[7.0]
  def change
    change_column :produits, :annee, :string
  end
end
