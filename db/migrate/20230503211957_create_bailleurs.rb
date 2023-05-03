class CreateBailleurs < ActiveRecord::Migration[7.0]
  def change
    create_table :bailleurs do |t|
      t.string :prenom
      t.string :nom
      t.string :telephone
      t.string :mail

      t.timestamps
    end
  end
end
