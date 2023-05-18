class AddNomToOccupations < ActiveRecord::Migration[7.0]
  def change
    add_column :occupations, :nom, :string
  end
end
