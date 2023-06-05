class CreateDemandes < ActiveRecord::Migration[7.0]
  def change
    create_table :demandes do |t|
      t.string :nom
      t.string :mail
      t.string :telephone
      t.string :type_demande
      t.text :commentaires

      t.timestamps
    end
  end
end
