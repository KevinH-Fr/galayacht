class AddToysToProduits < ActiveRecord::Migration[7.0]
  def change
    add_column :produits, :toys, :text
  end
end
