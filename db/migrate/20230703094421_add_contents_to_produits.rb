class AddContentsToProduits < ActiveRecord::Migration[7.0]
  def change
    add_column :produits, :tirant, :string
    add_column :produits, :members, :integer
    add_column :produits, :annee, :integer
    add_column :produits, :pavillon, :string
    add_column :produits, :moteur, :string
    add_column :produits, :vitesse, :string
    add_column :produits, :consommation, :string
  
  end
end
