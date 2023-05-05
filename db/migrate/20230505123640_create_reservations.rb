class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.references :produit, null: false, foreign_key: true
      t.references :preneur, null: false, foreign_key: true
      t.date :debutlocation
      t.date :finlocation
      t.integer :prix
      t.string :statut

      t.timestamps
    end
  end
end
