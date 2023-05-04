class CreateDestinations < ActiveRecord::Migration[7.0]
  def change
    create_table :destinations do |t|
      t.string :nom
      t.string :pays
      t.string :ville
      t.string :cp
      t.string :port

      t.timestamps
    end
  end
end
