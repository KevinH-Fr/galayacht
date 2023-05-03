class CreatePreneurs < ActiveRecord::Migration[7.0]
  def change
    create_table :preneurs do |t|
      t.string :prenom
      t.string :nom
      t.string :telephone
      t.string :mail

      t.timestamps
    end
  end
end
