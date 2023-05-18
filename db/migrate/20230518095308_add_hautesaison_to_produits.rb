class AddHautesaisonToProduits < ActiveRecord::Migration[7.0]
  def change
    add_column :produits, :prixjour_hautesaison, :integer
    add_column :produits, :prixsemaine_hautesaison, :integer
  end
end
