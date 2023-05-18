class CreateOccupations < ActiveRecord::Migration[7.0]
  def change
    create_table :occupations do |t|
      t.date :debut
      t.date :fin
      t.references :produit, null: true, foreign_key: true

      t.timestamps
    end
  end
end
