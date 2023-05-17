class AddDestinationToProduits < ActiveRecord::Migration[7.0]
  def change
    add_reference :produits, :destination, null: true, foreign_key: true
  end
end
